class CreateNewsProducts < ActiveRecord::Migration[5.2]
  def change
       create_table :news_products do |t|
    	t.integer :new_id
        t.integer :product_id
        t.timestamps
    end
  end
end
