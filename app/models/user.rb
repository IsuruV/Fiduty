class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :user_portfolios
  has_many :portfolios, :through => :user_portfolios
  has_many :reviews
  has_many :user_tasks
  has_many :tasks, :through => :user_tasks
  belongs_to :level, required: false
 
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    user.fb_id = auth.uid
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  
  def calculate_total_investment
    sum = 0
    self.user_portfolios.each do |portfolio|
      sum += portfolio.inital_investment.round(2)
    end
    sum
  end

  def portfolio_with_vals
    self.users_portfolios
    total_investments = self.calculate_total_investment
    total_gains = self.user_gain
    total_value = self.user_total_value
    roi = self.roi(total_value, total_investments)
    transactions_by_portfolios = self.user_portfolios.select('portfolio_id, portfolios.name, portfolios.description,
                                                                portfolios.ytd, portfolios.yield,portfolios.advisor_id, inital_investment,
                                                                  investment_date, holding_return').joins('LEFT OUTER JOIN portfolios ON
                                                                    portfolios.id = user_portfolios.portfolio_id')
                                  .order('portfolio_id asc').group_by { |d| d[:portfolio_id]}


    portfolio_sums = self.user_portfolios.select('portfolio_id, SUM(inital_investment)').group(:portfolio_id)
    # portfolio_sums = self.user_portfolios.select('portfolio_id, SUM(inital_investment) as total_investment, SUM(value) AS total_current_value, SUM(gain_loss) AS total_gain_loss').group(:portfolio_id)

    {"user_info": self, "total_gains": total_gains, "total_investments": total_investments,
    "total_value": total_value, "portfolios": transactions_by_portfolios,"total_values_per_portfolio": portfolio_sums, "roi": roi }

  end

  def roi(t_value, t_investment)
    begin
      ret_investment = (t_value - t_investment)/t_investment
    rescue
      ret_investment = 0
    end
    ret_investment
  end
  
  def self.top_friends_roi(fb_ids)
    array = []
    friends = User.where(fb_id: [fb_ids])
    friends.each do |friend|
      total_investments = friend.calculate_total_investment
      total_value = friend.user_total_value
      total_roi = friend.roi(total_value, total_investments)
      array.push({"name":friend.name, "fb_id": friend.fb_id, "total_roi": total_roi })
    end
   array.sort_by{|friend| friend["total_roi"]}[0,5]
  end

  def self.portfolios_with_vals
    @users = []
    User.all.each do |user|
      @users.push(user.portfolio_with_vals)
    end
    @users.sort_by{|user| user[:total_gains]}.reverse!
  end

  def user_total_value
    array = []
    self.user_portfolios.each do |transaction|
      # transaction.calc_holding_return
      transaction.calc_value
      array.push(transaction.value)
    end
    array.inject(0){|sum,x| sum + x }
  end

  def user_gain
    # total_investment= self.calculate_total_investment
    # total_value = self.user_total_value
    # gain = total_value - total_investment
    # gain
    total = 0
    self.users_portfolios.each do |transaction|
      if transaction.active
         transaction.calc_gain_loss
        total += transaction.gain_loss.round(2)
      end
    end
    total.round(2)
  end

  def users_portfolios
    self.user_portfolios.each do |transaction|
      transaction.calc_holding_return
      transaction.calc_value
    end

  end


  def self.recent_friend_investment(fb_ids)
      friends = User.where(fb_id: [fb_ids])
      transactions = []
      friends.each do |friend|
        if friend
          friend.user_portfolios.each do |transaction|
            portfolio = Portfolio.find(transaction.portfolio_id)
            transactions.push({'fb_id': friend.fb_id, 'user_id': friend.id, 'name': friend.name, 'last_portfolio_id': portfolio.id, 'last_portfolio_name': portfolio.name,
                              'roi': transaction.gain_loss, 'investment_date': transaction.investment_date.to_datetime.to_i})
          end

      end
    end
      sorted_transactions = transactions.sort_by{ |transaction| transaction[:investment_date]}.reverse!
      sorted_transactions
  end
  
  
  
  def self.everyone_investment
    friends = User.all
      transactions = []
      friends.each do |friend|
        if friend
          friend.user_portfolios.each do |transaction|
            portfolio = Portfolio.find(transaction.portfolio_id)
            transactions.push({'fb_id': friend.fb_id, 'user_id': friend.id, 'name': friend.name, 'last_portfolio_id': portfolio.id, 'last_portfolio_name': portfolio.name,
                              'roi': transaction.gain_loss, 'investment_date': transaction.investment_date.to_datetime.to_i})
          end

      end
    end
      sorted_transactions = transactions.sort_by{ |transaction| transaction[:investment_date]}.reverse!
      sorted_transactions
  end

  def subtract_from_funds(amt)
    amount = amt
    self.funds = self.funds - amount 
    self.save
  end
  
  def add_to_funds(amt)
    amount = amt
    self.funds = self.funds + amount 
    self.save
  end
  
  def create_new_level_tasks(updated_level)
    new_tasks = Task.where(level_id: updated_level)
    new_tasks.each do |task|
      task.user_tasks.create(user: self, completed: false)
    end
  end
  
  def add_inital_tasks
    self.level_id = 1
    self.save
    level_one_tasks = Task.where(level_id: 1)
    level_one_tasks.each do |task|
      task.user_tasks.create(user: self, completed: false)
    end
  end 
  
  def level_up
    bools = []
    self.user_tasks.each do |task|
      bools.push(task.completed)
    end 
    if !bools.include?(false) && !bools.empty?
     update_level = self.level.level + 1
     
     updated_level = Level.where(level: update_level).first
      self.level = updated_level
      self.save
     self.create_new_level_tasks(updated_level)
     self.level
   else
    tasks = []
    self.user_tasks.each do |task|
      if !task.completed
        tasks.push(task)
      end
    end
    if tasks
      "User has #{tasks.count} tasks remaning to reach next level"
    else
      "All tasks complete for #{self.level.level - 1}, User is now at level #{self.level.leve}"
    end
    end 
  end
  
  def complete_task(task)
    completed_task = self.user_tasks.where(task_id: task).first
    completed_task.update(completed: true)
    self.level_up
  end
  
  def check_valid_transactions(portfolio_id)
    transactions = self.user_portfolios.where(portfolio_id: portfolio_id)
    transactions.each do |transaction|
      if transaction.inital_investment == 0
        transaction.active = false
        transaction.save
      else
        transaction
      end
    end
  end
  
  def sell_investment(amount, portfolio_id)
    portfolio = Portfolio.find(portfolio_id)
    YahooApi.update_price(portfolio)
    
    realized_gains = 0
    transactions = self.user_portfolios.where(portfolio_id: portfolio_id)
  if transactions.sum(&:inital_investment) >= amount
    @sale = Sale.create(amount: amount)
    transactions.each do |transaction|
      if transaction.value <= amount
        realized_gains += transaction.value
        # transaction.very_inital_investment = transaction.inital_investment
        # transaction.inital_investment = 0
        transaction.active = false
        transaction.save
        @sale.user_portfolios << transaction
        # amount = amount - transaction.inital_investment
        amount -= transaction.value
      else
      
        realized_gains += amount
        transaction.very_inital_investment = transaction.inital_investment
        # transaction.inital_investment = transaction.inital_investment - amount
        transaction.inital_investment = transaction.value - amount
        transaction.save
        transaction.calc_weight
        transaction.calc_value
        transaction.calc_gain_loss 
       @sale.user_portfolios << transaction
        break
      end
    end
    @sale.save
    self.add_to_funds(realized_gains)
    self.check_valid_transactions(portfolio_id)
  else
    'Amount exceeds investments in portfolio'
  end
  end
  
end
# User.recent_friend_investment(["10209468294638125", "10207796683019394", "676779145826476"])
# very_inital_investment, active
