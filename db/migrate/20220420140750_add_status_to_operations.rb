class AddStatusToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :status, :integer
  end
end
