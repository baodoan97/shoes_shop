class CreateDistrict < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
    	t.string :district_name
    	t.string :district_id
    	t.integer :province_id
    end
  end
end
