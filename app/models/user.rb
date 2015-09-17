class User < ActiveRecord::Base
  has_many :orders
  has_one  :addresses
  has_many :items, through: :orders
end
