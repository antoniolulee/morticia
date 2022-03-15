class AddLtvAppraisalToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :ltv_appraisal, :decimal
  end
end
