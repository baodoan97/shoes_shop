class CreateNotification < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :content
      t.boolean :watched ,:default => false
      t.timestamps
    end
  end
end
