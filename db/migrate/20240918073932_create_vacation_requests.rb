class CreateVacationRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :vacation_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :status, default: "pending"
      t.text :description

      t.timestamps
    end
  end
end
