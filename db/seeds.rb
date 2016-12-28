# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

# Portfolio.all.each do |portfolio|
#     portfolio.reviews.create(content: Faker::Company.catch_phrase)
# end

# Review.all.each do |review|
#     review.rating = rand(1..5)
#     review.save
# end

# require 'csv'
# require 'pry'

# csv_text = File.read('db/migrate/Safety_Net.csv')
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|

#   @advisor = Advisor.find_or_create_by(type_of_fund: row[1], name: row[2], address: row[4])
#   @advisor.portfolios.find_or_create_by(open: row[10], day_high: row[11], day_low: row[12], volume: row[13], week_52: row[16], ytd: row[17], avg_1: row[19],
#                             avg_3: row[20], avg_5: row[21], market_cap: row[22], p_e: row[23], beta: row[24], description: row[29], investment_type: 'Safety Net',
#                             fund_type: row[3], down_side_risk: row[28])


# end

# csv_text = File.read('db/migrate/Conservative.csv')
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|

#   @advisor = Advisor.find_or_create_by(type_of_fund: row[1], name: row[2], address: row[4])
#   @advisor.portfolios.find_or_create_by(open: row[10], day_high: row[11], day_low: row[12], volume: row[13], week_52: row[16], ytd: row[17], avg_1: row[19],
#                             avg_3: row[20], avg_5: row[21], market_cap: row[22], p_e: row[23], beta: row[24], description: row[29], investment_type: 'Conservative',
#                             fund_type: row[3], down_side_risk: row[28])


# end

# csv_text = File.read('db/migrate/Moderate.csv')
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|

#   @advisor = Advisor.find_or_create_by(type_of_fund: row[1], name: row[2], address: row[4])
#   @advisor.portfolios.find_or_create_by(open: row[10], day_high: row[11], day_low: row[12], volume: row[13], week_52: row[16], ytd: row[17], avg_1: row[19],
#                             avg_3: row[20], avg_5: row[21], market_cap: row[22], p_e: row[23], beta: row[24], description: row[29], investment_type: 'Moderate',
#                             fund_type: row[3])


# end


# csv_text = File.read('db/migrate/Aggressive.csv')
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|

#   @advisor = Advisor.find_or_create_by(type_of_fund: row[1], name: row[2], address: row[4])
#   @advisor.portfolios.find_or_create_by(open: row[10], day_high: row[11], day_low: row[12], volume: row[13], week_52: row[16], ytd: row[17], avg_1: row[19],
#                             avg_3: row[20], avg_5: row[21], market_cap: row[22], p_e: row[23], beta: row[24], description: row[29], investment_type: 'Aggressive',
#                             fund_type: row[3], down_side_risk: row[28])
# end

#### YAHOO API to get risks

# CsvParser.etf_parser
# Portfolio.all.each do |portfolio|
#   YahooApi.update_portfolio_risk_ratios(portfolio)
# end
#### /YAHOO API to get risks
