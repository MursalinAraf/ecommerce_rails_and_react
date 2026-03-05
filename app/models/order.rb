class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items
  has_many :products, through: :order_items
  has_many :payments, dependent: :destroy

  enum status: {pending: 0, in_progress: 1, done: 2, rejected: 3, cancelled: 4}

  validates :status, presence: true
end
