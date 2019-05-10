class RemovePayIdOnCartProduct < ActiveRecord::Migration[5.2]
  def change
  	remove_column :cart_products, :pay_id
  end
end
