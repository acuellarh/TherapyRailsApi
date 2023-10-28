class Order < ApplicationRecord
  belongs_to :pacient
  belongs_to :order_status_type

  has_many :order_details
  has_many :payments

  validates :sale_date, presence:true
end
