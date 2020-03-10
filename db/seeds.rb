# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Item.destroy_all
User.destroy_all
Cart.destroy_all

images_array = ["https://cdn.pixabay.com/photo/2015/11/16/22/14/cat-1046544_960_720.jpg", "https://cdn.pixabay.com/photo/2013/01/25/13/03/cat-76116_960_720.jpg", "https://cdn.pixabay.com/photo/2018/03/27/17/25/cat-3266673_960_720.jpg", "https://cdn.pixabay.com/photo/2018/01/28/12/37/cat-3113513_960_720.jpg", "https://cdn.pixabay.com/photo/2017/03/29/09/59/cat-2184682_960_720.jpg", "https://cdn.pixabay.com/photo/2013/04/01/03/45/cat-98359_960_720.jpg", "https://cdn.pixabay.com/photo/2013/01/25/13/03/cat-76116_960_720.jpg", "https://cdn.pixabay.com/photo/2015/02/25/17/56/cat-649164_960_720.jpg", "https://cdn.pixabay.com/photo/2017/03/14/14/49/cat-2143332_960_720.jpg"]
9.times do |i|
  item = Item.create!(title: Faker::Creature::Cat.name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), price: Faker::Number.decimal(l_digits: 2), image_url: images_array[i-1])
end
test_user = User.create!(email: 'test@example.com', password: "password", password_confirmation: "password")
test_cart = Cart.create!(user: User.last)
test_cart.items.push(Item.all.last)