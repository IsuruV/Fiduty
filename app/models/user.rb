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
    transactions_by_portfolios = self.user_portfolios.select('portfolio_id, portfolios.name, portfolios.description, portfolios.ytd, portfolios.yield,portfolios.advisor_id, inital_investment, investment_date, holding_return').joins('LEFT OUTER JOIN portfolios ON portfolios.id = user_portfolios.portfolio_id')
                                  .order('portfolio_id asc').group_by { |d| d[:portfolio_id]}
    
    portfolio_sums = self.user_portfolios.select('portfolio_id, SUM(inital_investment) as total_values').group(:portfolio_id)
    
    {"user_info": self, "total_gains": total_gains, "total_investments": total_investments, 
    "total_value": total_value, "portfolios": transactions_by_portfolios,"total_value_per_portfolio": portfolio_sums }
                                  
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
    total_investment= self.calculate_total_investment
    total_value = self.user_total_value
    gain = total_value - total_investment
    gain
  end

  def users_portfolios
    self.user_portfolios.each do |transaction|
      transaction.calc_holding_return
      transaction.calc_value
    end

  end

end


