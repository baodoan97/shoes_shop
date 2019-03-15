class RemovePaymentId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :payment_items, :pay_id
  end
end
