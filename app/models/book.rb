class Book < ApplicationRecord
  belongs_to :user
  has_many :loans
  has_many :borrowers, through: :loans, source: :user

  validates :title, presence: true
end
