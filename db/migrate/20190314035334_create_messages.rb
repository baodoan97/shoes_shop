class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :admin_id
      t.text    :content
      t.boolean :usersend 
      t.timestamps
    end
  end
end
