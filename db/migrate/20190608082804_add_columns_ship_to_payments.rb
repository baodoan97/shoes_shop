class AddColumnsShipToPayments < ActiveRecord::Migration[5.2]
  def change
  	  	  	add_column :payments ,:transport_cost,:decimal

  end
end
