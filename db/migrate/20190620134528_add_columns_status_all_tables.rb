class AddColumnsStatusAllTables < ActiveRecord::Migration[5.2]
  def change 
  	  	add_column :products ,:status,:integer, default: 2
  	  	add_column :brands ,:status,:integer, default: 2
  	  	add_column :categories ,:status,:integer, default: 2
  	  	add_column :news_type_for_shoes,:status,:integer, default: 2
  	  	add_column :news,:status,:integer, default: 2
  	  	add_column :users,:status,:integer, default: 2
  end
end
