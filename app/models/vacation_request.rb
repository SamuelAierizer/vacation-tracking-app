class VacationRequest < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  STATUS_OPTIONS = %w[pending approved rejected].freeze

  validates :status, inclusion: { in: STATUS_OPTIONS }
end
