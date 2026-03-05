class Payment < ApplicationRecord
  belongs_to :order

  before_create :generate_transaction_id

  enum status: {pending: 0, paid: 1, failed: 2, refunded: 3}

  enum payment_method: {
    bkash: 0,
    nagad: 1,
    rocket: 2,
    card: 3,
    sslcommerz: 4,
    cash_on_delivery: 5
  }

  def generate_transaction_id
     self.transaction_id ||= SecureRandom.uuid 
  end
end
