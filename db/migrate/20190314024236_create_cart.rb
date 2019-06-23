class CreateCart < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
        t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "product_id"
    t.decimal "price", precision: 10
    t.integer "size"
    t.integer "quantity"
    end
  end
end
