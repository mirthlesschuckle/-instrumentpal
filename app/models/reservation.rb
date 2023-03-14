class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  STATUS_OPTIONS = ["accepted", "rejected", "pending"]
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: STATUS_OPTIONS }

end
