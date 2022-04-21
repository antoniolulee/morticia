class AddPhoneNumberToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :phone_number, :string
  end
end
