class Address < ApplicationRecord
  belongs_to :customer
  
  def address_display
  '〒' + post_code + ' ' + place + ' ' + name
  end
end
