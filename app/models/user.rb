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
    begin
      roi = (total_value - total_investments)/total_investments
    rescue
      roi = 0
    end
    transactions_by_portfolios = self.user_portfolios.select('portfolio_id, portfolios.name, portfolios.description, portfolios.ytd, portfolios.yield,portfolios.advisor_id, inital_investment, investment_date, holding_return').joins('LEFT OUTER JOIN portfolios ON portfolios.id = user_portfolios.portfolio_id')
                                  .order('portfolio_id asc').group_by { |d| d[:portfolio_id]}


    portfolio_sums = self.user_portfolios.select('portfolio_id, SUM(inital_investment)').group(:portfolio_id)
    # portfolio_sums = self.user_portfolios.select('portfolio_id, SUM(inital_investment) as total_investment, SUM(value) AS total_current_value, SUM(gain_loss) AS total_gain_loss').group(:portfolio_id)

    {"user_info": self, "total_gains": total_gains, "total_investments": total_investments,
    "total_value": total_value, "portfolios": transactions_by_portfolios,"total_values_per_portfolio": portfolio_sums, "roi": roi }

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
      transaction.calc_holding_return
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
    self.users_portfolios.each do |transaction|
      transaction.calc_gain_loss
    end
  end

  def users_portfolios
    self.user_portfolios.each do |transaction|
      transaction.calc_holding_return
      transaction.calc_value
    end

  end

  def self.recent_friend_investment(fb_ids)
    @friends = []
     fb_ids.each do |id|
      friend = User.where(fb_id: id).first
      if friend
        begin
        last_investment = friend.user_portfolios.last
        portfolio = Portfolio.find(last_investment.portfolio_id)
        @friends.push({'fb_id': friend.fb_id, 'user_id': friend.id, 'name': friend.name, 'last_portfolio_id': portfolio.id, 'last_portfolio_name': portfolio.name,
                                  'roi':last_investment.gain_loss})
        rescue
         @friends.push({'fb_id': friend.fb_id, 'user_id': friend.id, 'name': friend.name, 'last_portfolio_id': nil, 'last_portfolio_name': nil,
                                  'roi': nil})
        end
      end
    end
    @friends
  end

  def self.everyone_investment
    @everyone = []
    User.all.each do |user|
      if user.user_portfolios
        last_investment = user.user_portfolios.last
        portfolio = Portfolio.find(last_investment.portfolio_id)
        @everyone.push({'fb_id': user.fb_id, 'user_id': user.id, 'name': user.name, 'last_portfolio_id': portfolio.id, 'last_portfolio_name': portfolio.name,
                                'roi':last_investment.gain_loss})
      end
    end
    @everyone
  end


end
# User.recent_friend_investment(["10209468294638125", "10207796683019394", "676779145826476"])
