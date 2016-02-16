include Faker
include RandomData

10.times do 
	user = User.create!(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: Faker::Internet.password(10,20)
		)
end

users = User.all

15.times do 
	Item.create!(
		item: Faker::Lorem.sentence,
		completed: RandomData.random_boolean,
		user: users.sample
		)
end

items = Item.all? 



puts "Seed finished."
puts "#{Item.count} items created"
puts "#{User.count} users created"