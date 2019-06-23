class CreatePayment < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
    	t.string "name"
    t.string "phone"
    t.string "address"
    t.integer "pay_type"
    t.string "charge_id"
    t.integer "user_id"
    t.integer "status", default: 0, null: false
    end
  end
end
