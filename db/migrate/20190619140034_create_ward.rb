class CreateWard < ActiveRecord::Migration[5.2]
  def change
    create_table :wards do |t|
    	t.string :ward_name
    	t.string :ward_id
    	t.integer :district_id
    end
  end
end
