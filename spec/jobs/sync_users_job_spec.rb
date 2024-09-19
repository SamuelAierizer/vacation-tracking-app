require 'rails_helper'
require 'webmock/rspec'

RSpec.describe SyncUsersJob, type: :job do
  before do
    stub_request(:get, "https://gist.githubusercontent.com/alhafoudh/e46f708609366c762b7314e98aa213b9/raw/08e34a18eba801791c0b2557e1705e917a4b79bb/freevision_employees.json")
      .to_return(status: 200, body: employee_json, headers: { 'Content-Type' => 'application/json' })
  end

  let(:employee_json) {
    {
      "employees": [
        {
          "employee_id": "T001",
          "name": "John Doe",
          "date_of_birth": "1985-03-15",
          "department": "Engineering"
        },
        {
          "employee_id": "T002",
          "name": "Jane Smith",
          "date_of_birth": "1990-07-22",
          "department": "Marketing"
        }
      ]
    }.to_json
  }

  it 'creates new employees if they do not exist' do
    expect {
      SyncUsersJob.new.perform
    }.to change(User, :count).by(2)

    employee = User.where(employee_id: 'T001').limit(1).first
    expect(employee&.name).to eq('John Doe')
    expect(employee.date_of_birth).to eq(Date.parse('1985-03-15'))
  end

  it 'updates existing employees if their data has changed' do
    employee = User.create!(
      employee_id: 'T001',
      name: 'Old Name',
      email: 'test-changme@email.com',
      role: 'user',
      date_of_birth: '1985-03-15',
      department: Department.create!(name: 'Engineering')
    )

    expect {
      SyncUsersJob.new.perform
    }.to change(User, :count).by(1)

    employee.reload
    expect(employee.name).to eq('John Doe')
  end

  it 'creates new departments if they do not exist' do
    expect {
      SyncUsersJob.new.perform
    }.to change(Department, :count).by(2)
  end
end
