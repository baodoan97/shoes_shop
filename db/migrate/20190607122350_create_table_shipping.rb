class CreateTableShipping < ActiveRecord::Migration[5.2]
  def change
    create_table :transport_costs do |t|
    	t.string :province
    	t.decimal :price
    end
  end
end
