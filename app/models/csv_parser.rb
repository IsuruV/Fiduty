class CsvParser
  def self.upload(params)
    CSV.foreach(params[:leads].path, headers: true) do |row|
      @advisor = Advisor.create(type_of_fund: row[1], name: row[2], address: row[4])
      @advisor.portfolios.create(open: row[10], day_high: row[11], day_low: row[12], volume: row[13], week_52: row[16], ytd: row[17], avg_1: row[19],
                       avg_3: row[20], avg_5: row[21], market_cap: row[22], p_e: row[23], beta: row[24], description: row[29], investment_type: row[30],
                       fund_type: row[3], down_side_risk: row[28])
    end
  end

  def self.etf_parser
      CSV.foreach('db/migrate/ETFList.csv', headers: true) do |row|
        @portfolio = Portfolio.find_or_create_by(symbol: row[0], name: row[1], fund_type: "ETF")
      end
  end
  end

