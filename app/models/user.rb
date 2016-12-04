class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :user_portfolios
  has_many :portfolios, :through => :user_portfolios
  has_many :reviews
end
