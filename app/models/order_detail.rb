class OrderDetail < ApplicationRecord
  enum making_status: { cannot_make: 0, is_waiting: 1, is_making: 2, completed: 3 }
end
