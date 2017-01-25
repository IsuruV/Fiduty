class Level < ApplicationRecord
    has_many :tasks
    has_many :user_tasks, :through => :tasks
    has_many :users
end