class Item < ActiveRecord::Base
  has_many :orders
  has_one :users, through: :orders #ties users to items
end
