class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string "name"
    t.decimal "price", precision: 10
    t.text "description"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "liked", default: 0
    t.integer "brand_id"
    t.integer "customer", default: 0
    t.integer "status", default: 2
		
    end
  end
end
