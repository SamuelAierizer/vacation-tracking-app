class VacationRequestMailer < ApplicationMailer
  def status_notification
    @employee = params[:employee]
    @request = params[:request]

    mail(to: @employee.email, subject: "Your vacation request has been #{@request.status}")
  end
end
