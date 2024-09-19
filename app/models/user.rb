class User < ApplicationRecord
  has_many :vacation_requests, dependent: :destroy
  belongs_to :department

  validates :employee_id, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validate :end_date_after_start_date

  ROLE_OPTIONS = %w[admin user].freeze

  validates :role, inclusion: { in: ROLE_OPTIONS }
end
