class VacationRequest < ApplicationRecord
  belongs_to :employee

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  STATUS_OPTIONS = %w[pending approved rejected].freeze

  validates :status, inclusion: { in: STATUS_OPTIONS }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
