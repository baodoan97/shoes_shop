task Find_user_not_comfirmable: :environment do
   User.all.map do | user |
       if user.confirmed? == false
             user.destroy
        end
   end
end

task Find_carts_user_not_update_for_3_days: :environment do
   User.all.map do | user |
       Cart.where(user_id: user.id).map do |cat|
	       	if (DateTime.now.to_date - cat.updated_at.to_date).to_i  < 3
                 cat.destroy
	       	end	
       end
   end
end