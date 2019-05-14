class ChangeCartProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :cart_products, :user_id, :integer
  	remove_column :cart_products, :temp_cart
  end
end
