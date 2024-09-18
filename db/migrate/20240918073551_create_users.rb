class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :employee_id
      t.string :name, null: false
      t.string :email, null: false
      t.datetime :date_of_birth
      t.string :role
      t.datetime :start_date
      t.datetime :end_date
      t.references :department, foreign_key: true

      t.timestamps
    end

    add_index :users, :employee_id, unique: true
    add_index :users, :email, unique: true
  end
end
