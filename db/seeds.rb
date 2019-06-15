# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(:firstname => 'user1',
#             :lastname => 'user11',
#             :email => 'user1@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-03-15 10:20:55' ,
#             :updated_at => '2019-03-16 10:20:55'
#             )
# User.create(:firstname => 'user2',
#             :lastname => 'user22',
#             :email => 'user2@example.com',
#             :password => '123456',
#             :gender => false,
#             :created_at => '2019-03-14 10:20:55' ,
#             :updated_at =>' 2019-03-16 10:20:55'
#             )
# User.create(:firstname => 'user3',
#             :lastname => 'user33',
#             :email => 'user3@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => "2019-03-18 03:40:02" ,
#             :updated_at => "2019-03-18 03:40:02"
#             )
# User.create(:firstname => 'user5',
#             :lastname => 'user5',
#             :email => 'user5@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-02-14 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# User.create(:firstname => 'user5',
#             :lastname => 'user5',
#             :email => 'user4@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-03-13 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# User.create(:firstname => 'user6',
#             :lastname => 'user6',
#             :email => 'user6@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-02-01 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# User.create(:firstname => 'user7',
#             :lastname => 'user7',
#             :email => 'user7@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-01-11 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# User.create(:firstname => 'user8',
#             :lastname => 'user8',
#             :email => 'user8@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-01-21 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# User.create(:firstname => 'user9',
#             :lastname => 'user9',
#             :email => 'user9@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-02-13 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# User.create(:firstname => 'user10',
#             :lastname => 'user10',
#             :email => 'user10@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-01-21 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# User.create(:firstname => 'user11',
#             :lastname => 'user11',
#             :email => 'user11@example.com',
#             :password => '123456',
#             :gender => true,
#             :created_at => '2019-01-24 10:20:55' ,
#             :updated_at => '2019-03-14 10:20:55'
#             )
# Admin.create(
#    :email => 'admin@gmail.com',
#    :password => '123456',
# )
Carousel.create(
  new_id: nil,
  display: true,
  created_at: DateTime.now,
  updated_at: DateTime.now,
  main: false,
  image: Rack::Test::UploadedFile.new(Rails.root.join("app/assets/images/slide4.jpg"))
)
Carousel.create(
  new_id: nil,
  display: true,
  created_at: DateTime.now,
  updated_at: DateTime.now,
  main: false,
  image: Rack::Test::UploadedFile.new(Rails.root.join("app/assets/images/slide3.jpg"))
)
Carousel.create(
  new_id: nil,
  display: true,
  created_at: DateTime.now,
  updated_at: DateTime.now,
  main: true,
  image: Rack::Test::UploadedFile.new(Rails.root.join("app/assets/images/slide2.jpg"))
)



