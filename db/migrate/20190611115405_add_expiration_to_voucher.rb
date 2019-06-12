class AddExpirationToVoucher < ActiveRecord::Migration[5.2]
  def change
  	add_column :vouchers, :expiration, :date
  end
end
