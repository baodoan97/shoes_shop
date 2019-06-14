class AddColumnCustomerToProducts < ActiveRecord::Migration[5.2]
  def change
  	add_column :products ,:customer,:integer, default: 0
  end
end
