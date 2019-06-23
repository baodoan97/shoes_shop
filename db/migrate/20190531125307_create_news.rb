class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.text :title
      t.text :body
      t.integer :news_type_for_shoe_id
      t.integer :status, default: 2
      t.timestamps
    end
  end
end
