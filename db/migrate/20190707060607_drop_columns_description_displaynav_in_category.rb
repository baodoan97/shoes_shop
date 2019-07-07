class DropColumnsDescriptionDisplaynavInCategory < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories, :description
  	remove_column :categories, :display_in_navbar
  end
end
