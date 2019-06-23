class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	 t.integer "product_id"
    t.integer "user_id"
    t.text "content", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display", default: false
    end
  end
end
