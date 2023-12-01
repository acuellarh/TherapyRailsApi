class ProductCategory < ApplicationRecord
  has_many :products

  validates :name, :description, presence: true
  validates :name, :description, uniqueness: true
  validates :name, :description, length: { minimum: 4 }
  
end
