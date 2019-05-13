class AddSttToPayment < ActiveRecord::Migration[5.2]
  def change
  	add_column :payments, :status, :integer, null: false, default: 0
  end
end
