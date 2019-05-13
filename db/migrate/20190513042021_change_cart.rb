class ChangeCart < ActiveRecord::Migration[5.2]
  def change
  	remove_column :carts, :user_id
    add_column :carts, :temp_cart, :string
  end
end
