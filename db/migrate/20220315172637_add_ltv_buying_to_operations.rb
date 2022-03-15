class AddLtvBuyingToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :ltv_buying, :decimal
  end
end
