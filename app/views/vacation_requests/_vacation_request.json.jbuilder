json.extract! vacation_request, :id, :user, :start_date, :end_date, :status, :description, :created_at, :updated_at
json.url vacation_request_url(vacation_request, format: :json)
