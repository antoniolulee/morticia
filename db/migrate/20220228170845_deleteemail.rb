class Deleteemail < ActiveRecord::Migration[7.0]
  def change
    remove_column :operations, :email
  end
end
