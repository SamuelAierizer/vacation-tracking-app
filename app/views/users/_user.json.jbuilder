json.extract! user, :id, :employee_id, :name, :email, :date_of_birth, :role, :start_date, :end_date, :departament_id, :created_at, :updated_at
json.url user_url(user, format: :json)
