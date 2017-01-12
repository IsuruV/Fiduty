class UserPortfolio < ApplicationRecord
    belongs_to :user
    belongs_to :portfolio

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
    YahooApi.fetch_recent_price(@portfolio)
    ### Inefficient, must refactor.
    current_price = @portfolio.price
    if self.price
      holding_return = self.price - current_price
    else
      holding_ret = 0
    end
    self.holding_return = holding_ret
    self.save
  end

  def calc_value
    @portfolio = Portfolio.find(self.portfolio_id)
    YahooApi.fetch_recent_price(@portfolio)
    value = @portfolio.price * self.weight
    self.value = value
    self.save
  end

  def calc_gain_loss

    @portfolio = Portfolio.find(self.portfolio_id)
    updated_portfolio_price = YahooApi.update_price(@portfolio)
    self.gain_loss = updated_portfolio_price.to_f - self.inital_investment
    return self.gain_loss
   
    # gain_loss = self.value - self.inital_investment
    # self.gain_loss = gain_loss
    # self.save
  end
end
