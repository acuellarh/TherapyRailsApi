class DocumentType < ApplicationRecord
  has_many :pacients

  validates :name, presence: true
  validates :name, uniqueness: true
end
