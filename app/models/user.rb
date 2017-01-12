class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :user_portfolios
  has_many :portfolios, :through => :user_portfolios
  has_many :reviews

  def calculate_total_investment
    sum = 0
    self.user_portfolios.each do |portfolio|
      sum += portfolio.inital_investment
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
      transaction.calc_gain_loss
      total += transaction.gain_loss
    end
    total
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


end
# User.recent_friend_investment(["10209468294638125", "10207796683019394", "676779145826476"])
