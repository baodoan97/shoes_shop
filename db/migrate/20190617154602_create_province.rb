class CreateProvince < ActiveRecord::Migration[5.2]
  def change
    create_table(:provinces, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
    	t.string :province_name
    	t.string :province_id
    end
  end
end
