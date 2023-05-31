class Book < ApplicationRecord
  belongs_to :user
  has_many :loans
  has_many :borrowers, through: :loans, source: :user

  validates :title, presence: true

  def self.search(search)
    if search != ""
      Book.where('title LIKE(?)', "%#{search}%")
    else
      Book.all
    end
  end

end
