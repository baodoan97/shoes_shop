class AddColumnsDisplayToComment < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :display, :boolean ,:default => false
  end
end
