class AddPaymentIdToPaymentItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :payment_items, :payment_id, :integer
  end
end
