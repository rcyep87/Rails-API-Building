class User < ActiveRecord::Base
  has_one  :address
  has_many :orders
  has_many :items, through: :orders
end
