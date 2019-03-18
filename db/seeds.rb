# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:firstname => 'user1',
            :lastname => 'user11',
            :email => 'user1@example.com',
            :password => '123456',
            :gender => true,
            :created_at => '2019-03-15 10:20:55' ,
            :updated_at => '2019-03-16 10:20:55'
         )
 User.create(:firstname => 'user2',
         :lastname => 'user22',
         :email => 'user2@example.com',
         :password => '123456',
         :gender => false,
         :created_at => '2019-03-14 10:20:55' ,
         :updated_at =>' 2019-03-16 10:20:55' 
      ) 
User.create(:firstname => 'user3',
      :lastname => 'user33',
      :email => 'user3@example.com',
      :password => '123456',
      :gender => true,
      :created_at => "2019-03-18 03:40:02" ,
      :updated_at => "2019-03-18 03:40:02" 
   )
User.create(:firstname => 'user4',
   :lastname => 'user44',
   :email => 'user4@example.com',
   :password => '123456',
   :gender => true,
   :created_at => 2019-03-11 10:20:55 ,
   :updated_at => 2019-03-14 10:20:55 
)        