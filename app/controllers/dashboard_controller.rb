class DashboardController < ApplicationController
  def index
    @employees = User.includes(:vacation_requests)
                         .order(name: :asc)
  end

  def admin
    @employees = User.includes(:vacation_requests)
                         .order(name: :asc)
  end
end
