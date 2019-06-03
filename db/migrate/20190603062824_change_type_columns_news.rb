class ChangeTypeColumnsNews < ActiveRecord::Migration[5.2]
  def change
  	change_column :news, :title, :text
  end
end
