class CreateVoucher < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|
    	t.integer "payment_id"
    t.string "code"
    t.integer "percent"
    t.date "expiration"
    end
  end
end
