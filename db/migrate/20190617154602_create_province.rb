class CreateProvince < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
    	t.string :province_name
    	t.string :province_id
    end
  end
end
