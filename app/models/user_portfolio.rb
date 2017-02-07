class UserPortfolio < ApplicationRecord
    belongs_to :user
    belongs_to :portfolio
    has_many :user_portfolio_sales
    has_many :sales, :through => :user_portfolio_sales
    default_scope { where(active: true) }
    # default_scope{ where('ROUND(gain_loss, 3)') }
    
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
    current_price = @portfolio.price.round(2)
    if self.trad_price
      holding_ret = (current_price - self.trad_price.round(2))/self.trad_price.round(2)
    else
      holding_ret = 0
    end
    self.holding_return = holding_ret
    self.save
  end
  
  def calc_weight
    new_weight = self.inital_investment.round(2) / self.portfolio.price.round(2)
    self.weight = new_weight
    self.save
  end
  def calc_value
    @portfolio = Portfolio.find(self.portfolio_id)
    # YahooApi.fetch_recent_price(@portfolio)
    value = @portfolio.price.round(2) * self.weight.round(2)
    self.value = value
    self.save
  end

  def calc_gain_loss
    self.calc_value
    gain_loss = self.value.round(2) - self.inital_investment.round(2)
    self.gain_loss = gain_loss
    self.save
  end

end
