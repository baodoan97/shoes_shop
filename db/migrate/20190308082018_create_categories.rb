class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    unless table_exists? :categories
      create_table :categories do |t|
        t.string "name"
      t.text "description", limit: 4294967295
      t.boolean "display_in_navbar"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "status", default: 2
      end
    end
  end
end
