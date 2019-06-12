class AddMainToCarousels < ActiveRecord::Migration[5.2]
  def change
    add_column :carousels, :main, :boolean, :default => false
  end
end
