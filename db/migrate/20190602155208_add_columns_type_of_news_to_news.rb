class AddColumnsTypeOfNewsToNews < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :news ,:news_type_for_shoe_id,:integer
  end
end
