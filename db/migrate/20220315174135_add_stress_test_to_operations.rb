class AddStressTestToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :stress_test, :decimal
  end
end
