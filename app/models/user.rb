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

  # def calculate_current_value
  #   self.portfolios.each do |portfolio|
  #     YahooApi.update_ytd(portfolio)
  #   end
  #   transactions = UserPortfolio.where(user_id: self.id)
  #   transactions.map do |transaction|
  #     portfolio = Portfolio.find_by_id(transaction.portfolio_id)
  #     transaction.weight = (portfolio.ytd_raw - transaction.ytd) * transaction.inital_investment
  #     transaction.save
  #   end
  #   transactions_by_portfolios = transactions.select('AVG(weight) as avg_return').group('portfolio_id').order('portfolio_id')
  # end
  def portfolio_with_vals
    transactions_by_portfolios = self.user_portfolios.select('portfolio_id, portfolios.name, portfolios.description, portfolios.ytd, portfolios.yield,portfolios.advisor_id, inital_investment, investment_date, holding_return').joins('LEFT OUTER JOIN portfolios ON portfolios.id = user_portfolios.portfolio_id')
                                  .order('portfolio_id asc').group_by { |d| d[:portfolio_id]}
    
    portfolio_sums = self.user_portfolios.select('portfolio_id, SUM(inital_investment) as total_values').group(:portfolio_id)
    
    {"portfolios": transactions_by_portfolios,"total_value": portfolio_sums }
                                  
  end 
  
  def user_total_value
    array = []
    self.user_portfolios.each do |transaction|
      transaction.calc_value
      array.push(transaction.value)
    end
    array.inject(0){|sum,x| sum + x }
  end

  def user_gain
    total_investment= self.calculate_total_investment
    total_value = self.user_total_value
    gain = total_value + total_investment
    gain
  end

  def users_portfolios
    self.user_portfolios.each do |transaction|
      transaction.calc_holding_return
      transaction.calc_value
      transaction.calc_gain_loss
    end

  end

end


# array = []
# self.portfolios.each do |portfolio|
#   array.push({"totalValue": portfoio.total_value(self), "holding_return": portfolio.holding_return(self),
#     "ytd": portfolio.ytd_raw, "description": portfolio.description })
# end
# array
