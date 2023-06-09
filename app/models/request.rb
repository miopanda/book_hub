class Request < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :request_type
  belongs_to :user

  validates :message, presence: true
  validates :request_type_id, numericality: { other_than: 1 , message: "can't be blank"}
end
