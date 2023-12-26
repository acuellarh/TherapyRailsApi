class Product < ApplicationRecord
  belongs_to :product_category
  has_many :order_details

  validates :name, :price, :quantity, :status, :product_category_id, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 4 }

end
