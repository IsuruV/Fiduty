class YahooApi
  def self.update_portfolio_risk_ratios(portfolio)

    begin
      con = Faraday.new
      res = con.get "https://query2.finance.yahoo.com/v10/finance/quoteSummary/#{portfolio.symbol}?formatted=true&crumb=QtGhLQr%2FrgH&lang=en-US&region=US&modules=assetProfile%2CfundPerformance%2CdefaultKeyStatistics&corsDomain=finance.yahoo.com"
      response = JSON.parse(res.body)
      if response["quoteSummary"]["result"][0]["fundPerformance"]
        if response["quoteSummary"]["result"][0]["defaultKeyStatistics"]["fundFamily"]
          fund_family = response["quoteSummary"]["result"][0]["defaultKeyStatistics"]["fundFamily"]
          advisor = Advisor.find_or_create_by(name: fund_family,type_of_fund: 'robot')
        else
          advisor = Advisor.find_or_create_by(name:'not available')
        end

      description = response["quoteSummary"]["result"][0]["assetProfile"]["longBusinessSummary"]
      risks = response["quoteSummary"]["result"][0]["fundPerformance"]["riskOverviewStatistics"]["riskStatistics"][1]
      alpha = risks["alpha"]["raw"]
      beta = risks["beta"]["raw"]
      meanAnnualReturn = risks["meanAnnualReturn"]["raw"]
      rSquared = risks["rSquared"]["raw"]
      stdDev = risks["stdDev"]["raw"]
      sharpeRatio = risks["sharpeRatio"]["raw"]
      treynorRatio = risks["treynorRatio"]["raw"]

      portfolio.update(description: description, alpha: alpha, beta: beta, meanAnnualReturn: meanAnnualReturn,
                                  rSquared: rSquared, stdDev: stdDev, sharpeRatio: sharpeRatio,
                                  treynorRatio: treynorRatio)
      portfolio.advisor = advisor
      portfolio.save
      else
        Portfolio.destroy(portfolio)
      end
    rescue
        Portfolio.destroy(portfolio)
    end

  end

  def self.real_time_quotes(ticker)
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.quotes([ticker], [:ask, :bid, :last_trade_date])
  end

end
