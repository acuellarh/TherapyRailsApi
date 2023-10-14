class Order < ApplicationRecord
  belongs_to :pacient
  validates :sale_date, presence:true
end
