class CreateTypeOfNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news_type_for_shoes do |t|
        t.string :name
        t.timestamps
	t.integer :status, default: 2
    end
  end
end
