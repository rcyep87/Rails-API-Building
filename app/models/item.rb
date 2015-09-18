class Item < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders #ties users to items
end
