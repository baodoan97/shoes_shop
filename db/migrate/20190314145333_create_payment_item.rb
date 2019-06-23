class CreatePaymentItem < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_items do |t|
    	t.integer "product_id"
    t.decimal "price", precision: 10
    t.integer "size"
    t.integer "quantity"
    t.integer "payment_id"
    end
  end
end
