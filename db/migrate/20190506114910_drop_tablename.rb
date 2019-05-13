class DropTablename < ActiveRecord::Migration[5.2]
  def change
  	drop_table :bill_details
  end
end
