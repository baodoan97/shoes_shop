class AddSizeToCartProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :cart_products, :size, :integer
  end
end
