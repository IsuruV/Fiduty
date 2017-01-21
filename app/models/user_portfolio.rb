class UserPortfolio < ApplicationRecord
    belongs_to :user
    belongs_to :portfolio
    default_scope { where(active: true) }

  def self.recent_investments
    investments = UserPortfolio.find(:all, :order => "id desc", :limit => 25).reverse
    array = []
    investments.each do |investment|
      portfolio = Portfolio.find(investment.portfolio_id)
      user = user.find(investment.user_id)
      array.push({"portfolio": portfolio,"user": user})
    end
  end

  def calc_holding_return
    @portfolio = Portfolio.find(self.portfolio_id)
    # YahooApi.fetch_recent_price(@portfolio)
    ### Inefficient, must refactor.
    current_price = @portfolio.price
    if self.trad_price
      holding_ret = (current_price - self.trad_price)/self.trad_price
    else
      holding_ret = 0
    end
    self.holding_return = holding_ret
    self.save
  end

  def calc_value
    @portfolio = Portfolio.find(self.portfolio_id)
    # YahooApi.fetch_recent_price(@portfolio)
    value = @portfolio.price * self.weight
    self.value = value
    self.save
  end

  def calc_gain_loss
    self.calc_value
    gain_loss = self.value - self.inital_investment
    self.gain_loss = gain_loss
    self.save
  end

end
