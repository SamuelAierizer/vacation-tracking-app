class User < ApplicationRecord
  has_many :vacation_requests, dependent: :destroy

  validates :employee_id, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
