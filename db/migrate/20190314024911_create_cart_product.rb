class CreateCartProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
    	t.integer "product_id"
    t.decimal "price", precision: 10
    t.integer "size"
    t.integer "quantity"
    t.integer "cart_id"
    t.integer "user_id"
    end
  end
end
