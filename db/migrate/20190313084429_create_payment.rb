class CreatePayment < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
    	t.string :name
    	t.string :phone
   		t.string :address
   		t.string :pay_type
    end
  end
end
