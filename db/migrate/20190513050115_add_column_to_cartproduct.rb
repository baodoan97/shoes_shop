class AddColumnToCartproduct < ActiveRecord::Migration[5.2]
  def change
  	 add_column :cart_products, :temp_cart, :string
  end
end
