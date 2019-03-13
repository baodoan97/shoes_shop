class CreateBillDetail < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_details do |t|
    	t.integer :bill_id
    	t.integer :product_id
    	t.integer :quantity
    	t.decimal :price
    	t.decimal :subtotal
    	
   end
  end
end
