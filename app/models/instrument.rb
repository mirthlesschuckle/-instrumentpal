class Instrument < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
