class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand_name
      t.integer :category_id
      t.timestamps
      t.integer :status, default: 2
    end
  end
end
