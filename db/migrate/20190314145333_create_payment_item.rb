class CreatePaymentItem < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_items do |t|
    	t.integer :product_id
	    t.decimal  :price
	    t.integer   :size
	    t.integer :quantity
    	t.integer :pay_id
    end
  end
end
