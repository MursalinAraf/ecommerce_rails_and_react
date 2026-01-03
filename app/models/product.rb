class Product < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
  validates :stock, presence: 
  
  has_many :order_items
end
