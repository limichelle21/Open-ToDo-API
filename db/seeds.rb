include Faker
# require "random_data"
include RandomData

10.times do 
	user = User.create!(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password_digest: Faker::Internet.password(10,20)
		)
end

users = User.all


5.times do 
	List.create!(
		title: Faker::Lorem.words,
		user: users.sample
		)
end

lists = List.all


15.times do 
	Item.create!(
		item: Faker::Lorem.sentence,
		completed: RandomData.random_boolean,
		list: lists.sample
		)
end

items = Item.all



puts "Seed finished."
puts "#{List.count} lists created"
puts "#{Item.count} items created"
puts "#{User.count} users created"