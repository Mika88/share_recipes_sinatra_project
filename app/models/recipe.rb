class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments, through: :users
end