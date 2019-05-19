class UpdateColumnsToCarts < ActiveRecord::Migration[5.2]
  def change
	    remove_column :carts, :temp_cart
	    add_column :carts, :user_id, :integer
	    add_column :carts, :product_id, :integer
	    add_column :carts, :price, :decimal
	    add_column :carts, :size, :integer
	    add_column :carts, :quantity, :integer
  end
end
