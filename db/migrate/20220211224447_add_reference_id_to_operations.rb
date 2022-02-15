class AddReferenceIdToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :reference_id, :string
  end
end
