class AddTotalAndOrderIdToPayment < ActiveRecord::Migration[5.2]
  def change
  	add_column :payments, :total, :decimal
  	add_column :payments, :order_id, :string
  end
end
