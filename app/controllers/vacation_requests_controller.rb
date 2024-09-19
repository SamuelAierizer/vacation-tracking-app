class VacationRequestsController < ApplicationController
  before_action :set_vacation_request, only: %i[ show edit update destroy ]

  # GET /vacation_requests or /vacation_requests.json
  def index
    @vacation_requests = VacationRequest.all.includes(:user)
  end

  # GET /vacation_requests/1 or /vacation_requests/1.json
  def show
  end

  # GET /vacation_requests/new
  def new
    @vacation_request = VacationRequest.new
  end

  # GET /vacation_requests/1/edit
  def edit
  end

  # POST /vacation_requests or /vacation_requests.json
  def create
    @vacation_request = VacationRequest.new(vacation_request_params)

    respond_to do |format|
      if @vacation_request.save
        format.html { redirect_to @vacation_request, notice: "Vacation request was successfully created." }
        format.json { render :show, status: :created, location: @vacation_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacation_requests/1 or /vacation_requests/1.json
  def update
    respond_to do |format|
      if @vacation_request.update(vacation_request_params)
        format.html { redirect_to @vacation_request, notice: "Vacation request was successfully updated." }
        format.json { render :show, status: :ok, location: @vacation_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacation_requests/1/update_status
  def update_status
    @vacation_request = VacationRequest.find(params[:vacation_request_id])

    if @vacation_request.update(status: params[:status])
      VacationRequestMailer.with(employee: @vacation_request.user, request: @vacation_request).status_notification.deliver_now

      redirect_to dashboard_admin_path, notice: "Vacation request has been #{params[:status]}."
    else
      redirect_to dashboard_admin_path, error: "Faild to update status for vacation request."
    end
  end

  # DELETE /vacation_requests/1 or /vacation_requests/1.json
  def destroy
    @vacation_request.destroy!

    respond_to do |format|
      format.html { redirect_to vacation_requests_path, status: :see_other, notice: "Vacation request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_request
      @vacation_request = VacationRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_request_params
      params.require(:vacation_request).permit(:user_id, :start_date, :end_date, :status, :description)
    end
end
