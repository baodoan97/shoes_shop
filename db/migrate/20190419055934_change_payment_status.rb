class ChangePaymentStatus < ActiveRecord::Migration[5.2]
  def change
  	remove_column :payments, :status
  end
end
