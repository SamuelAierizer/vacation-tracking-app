class SyncUsersJob
  include Sidekiq::Job

  def perform
    client = UserApiClient.new
    employees_data = client.fetch_employees

    employees_data.each do |employee_data|
      synchronize_employee(employee_data)
    end
  end

  private

  def synchronize_employee(employee_data)
    employee = User.where(employee_id: employee_data["employee_id"]).limit(1).first

    if employee
      puts "start update"
      update_employee_if_needed(employee, employee_data)
    else
      puts "create"
      create_new_employee(employee_data)
    end
  end

  def update_employee_if_needed(employee, employee_data)
    if employee_needs_update?(employee, employee_data)
      employee.update!(
        name: employee_data["name"],
        date_of_birth: employee_data["date_of_birth"],
        department_id: Department.find_or_create_by(name: employee_data["department"])&.id
      )
    end
  end

  def employee_needs_update?(employee, employee_data)
    employee.name != employee_data["name"] ||
    employee.date_of_birth.to_s != employee_data["date_of_birth"] ||
    employee.department&.name != employee_data["department"]
  end

  def create_new_employee(employee_data)
    department = Department.find_or_create_by!(name: employee_data["department"])

    User.create!(
      employee_id: employee_data["employee_id"],
      name: employee_data["name"],
      email: "#{employee_data["employee_id"]}-changeme@email.com",
      role: "user",
      start_date: Date.today,
      date_of_birth: employee_data["date_of_birth"],
      department_id: department.id
    )
  end
end
