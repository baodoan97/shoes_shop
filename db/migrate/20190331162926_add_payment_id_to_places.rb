class AddPaymentIdToPlaces < ActiveRecord::Migration[5.2]
  def change
  	  		    add_column :places, :payment_id, :integer

  end
end
