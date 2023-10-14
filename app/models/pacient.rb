class Pacient < ApplicationRecord
  has_many :orders

  belongs_to :gender
  belongs_to :relationship
  belongs_to :document_type

  validates :name, :lastname, :birthday, :identifier, :mobile, :email, :address, :other_contact, :other_contact_mobile, :status, presence: true
  validates :identifier, :email, uniqueness: true
  validates :name, :lastname, :other_contact, length: { minimum: 4 }
  validates :address, length: { minimum: 4 }

end
