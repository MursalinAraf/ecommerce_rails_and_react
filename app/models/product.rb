class Product < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end
