class DropAddPayTypeToPayments < ActiveRecord::Migration[5.2]
  def change
  		remove_column :payments, :pay_type
  		    add_column :payments, :pay_type, :integer

  end
end
