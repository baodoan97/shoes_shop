class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
     t.integer "user_id"
    t.integer "admin_id"
    t.text "content", limit: 4294967295
    t.boolean "usersend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end
