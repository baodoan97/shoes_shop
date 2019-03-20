class AddLikedSoldToProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :products, :liked, :integer, default: 0
  end
end
