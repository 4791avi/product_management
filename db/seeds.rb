# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000.times do 
	Product.create(
		name: 		 	Faker::Name.name,
		description:    Faker::Quote.famous_last_words,
		price: 			Faker::Number.number(digits: 7),
		availability:   Faker::Boolean.boolean,
		img_url: 		Faker::Internet.url(host: 'avimehta.com')
	)
end

puts "1000 Products created through seed file"