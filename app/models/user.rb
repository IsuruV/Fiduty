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
    current_user.user_portfolios.each do |portfolio|
      sum += portfolio.inital_investment
    end
    sum
  end

  def calculate_current_value
    # current_val = []
    # current_user.portfolios.each do |portfolio|
    #   portfolio.real_time_quotes["last_trade_price"].to_i - portfolio.
    # end
  end

end
