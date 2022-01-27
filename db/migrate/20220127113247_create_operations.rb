class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.decimal :requested_money
      t.decimal :buying_price
      t.decimal :appraisal_price
      t.integer :years_duration
      t.integer :year_of_birth
      t.decimal :annual_gross_income
      t.string :city
      t.string :name
      t.string :interest_type
      t.string :email

      t.timestamps
    end
  end
end
