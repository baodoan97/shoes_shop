class RemoveQtySizeOfProduct < ActiveRecord::Migration[5.2]
  def change
  	remove_column :products, :size
	remove_column :products, :quantity
  end
end
