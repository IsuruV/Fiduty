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
      ytd = response["quoteSummary"]["result"][0]["fundPerformance"]["performanceOverview"]["ytdReturnPct"]["fmt"]
      ytd_raw = response["quoteSummary"]["result"][0]["fundPerformance"]["performanceOverview"]["ytdReturnPct"]["raw"]

      portfolio.update(description: description, alpha: alpha, beta: beta, meanAnnualReturn: meanAnnualReturn,
                                  rSquared: rSquared, stdDev: stdDev, sharpeRatio: sharpeRatio,
                                  treynorRatio: treynorRatio, avg_1: ytd, ytd: ytd, ytd_raw: ytd_raw)
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
    data = yahoo_client.quotes([ticker], [:last_trade_date,:last_trade_price, :previous_close, :high, :low, :volume, :change], { raw: false })
    data_formatted = data[0]
    {"last_trade_date": data_formatted[:last_trade_date],"last_trade_price": data_formatted[:last_trade_price],"previous_close": data_formatted[:previous_close],"high": data_formatted[:high], "low": data_formatted[:low], "volume": data_formatted[:volume], "change": data_formatted[:change]}
  end

  def self.update_ytd(portfolio)
    con = Faraday.new
    res = con.get "https://query2.finance.yahoo.com/v10/finance/quoteSummary/#{portfolio.symbol}?formatted=true&crumb=QtGhLQr%2FrgH&lang=en-US&region=US&modules=assetProfile%2CfundPerformance%2CdefaultKeyStatistics&corsDomain=finance.yahoo.com"
    response = JSON.parse(res.body)
    ytd = response["quoteSummary"]["result"][0]["fundPerformance"]["performanceOverview"]["ytdReturnPct"]["fmt"]
    ytd_raw = response["quoteSummary"]["result"][0]["fundPerformance"]["performanceOverview"]["ytdReturnPct"]["raw"]
    portfolio.update(ytd: ytd, ytd_raw: ytd_raw)
    return portfolio
  end
  def self.update_yield(portfolio)
    con = Faraday.new
    res = con.get "https://query2.finance.yahoo.com/v10/finance/quoteSummary/#{portfolio.symbol}?formatted=true&crumb=QtGhLQr%2FrgH&lang=en-US&region=US&modules=defaultKeyStatistics%2CassetProfile%2CtopHoldings%2CfundPerformance%2CfundProfile&corsDomain=finance.yahoo.com"
    response = JSON.parse(res.body)
     dividend  = response["quoteSummary"]["result"][0]["defaultKeyStatistics"]["yield"]["raw"]
     portfolio.update(yield: dividend)
  end

end
