class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  enum status: {pending: 0, in_progress: 1, done: 2, rejected: 3, cancelled: 4}
end
