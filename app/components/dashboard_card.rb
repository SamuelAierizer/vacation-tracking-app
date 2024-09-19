# frozen_string_literal: true

class DashboardCard < ViewComponent::Base
  def initialize(employee:, type:)
    @employee = employee
    @type = type
  end
end
