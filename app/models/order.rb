class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { is_waiting: 0, is_confirming: 1, is_making: 2, is_preparing: 3, completed: 4 }
end
