class AddStock < ActiveRecord::Migration[5.2]
  def change
  	create_table :stocks do |t|
      t.integer :product_id
      t.integer :size
      t.integer :quantity
    end
  end
end
