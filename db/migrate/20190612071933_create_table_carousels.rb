class CreateTableCarousels < ActiveRecord::Migration[5.2]
  def change
    create_table :carousels do |t|
    	t.integer :new_id	 
    	t.boolean :display , :default => false
	t.boolean :main, default: false
    	t.timestamps 
    end
  end
end
