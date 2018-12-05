class Recipe < ActiveRecord::Base
  belongs_to :User
  has_many :comments, through: :users
end