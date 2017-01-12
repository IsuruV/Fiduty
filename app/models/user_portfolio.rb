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
    @updated_portfolio = YahooApi.update_ytd(@portfolio)
    ### Inefficient, must refactor.
    currentYTD = @portfolio.ytd_raw
    if self.ytd 
      holding_ret = self.ytd - currentYTD
    else
      holding_ret = currentYTD
    end
    self.holding_return = holding_ret
    self.save
  end

  def calc_value
    self.calc_gain_loss
    self.value = self.inital_investment + self.gain_loss
    self.save
  end

  def calc_gain_loss
    @portfolio = Portfolio.find(self.portfolio_id)
    updated_portfolio_price = YahooApi.update_price(@portfolio)
    self.gain_loss = updated_portfolio_price.to_f - self.inital_investment
    self.save
    return self.gain_loss
  end
end
