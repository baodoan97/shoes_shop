class CreateChat < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
    	t.integer :user_id
    	t.integer :admin_id
	    t.text    :content
	    t.timestamps
    end
  end
end
