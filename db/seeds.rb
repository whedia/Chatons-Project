# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Item.destroy_all

images_array = ["https://pixabay.com/fr/photos/cat-des-animaux-animal-de-compagnie-3449999/", "https://pixabay.com/fr/photos/cat-animaux-des-animaux-grey-cat-3261420/", "https://pixabay.com/fr/photos/cat-portrait-des-animaux-animaux-3374422/", "https://pixabay.com/fr/photos/cat-cat-s-eyes-%C5%93il-des-animaux-2143332/", "https://pixabay.com/fr/photos/gueule-de-bois-cat-visage-de-chat-4864605/", "https://pixabay.com/fr/photos/des-animaux-cat-chaton-b%C3%A2illements-339400/", "https://cdn.pixabay.com/photo/2017/11/09/21/41/cat-2934720__340.jpg", "https://pixabay.com/fr/photos/cat-animal-de-compagnie-yeux-468232/", "https://pixabay.com/fr/photos/cat-yeux-bleus-animal-de-compagnie-3336579/"]
9.times do |i|
  item = Item.create!(title: Faker::Creature::Cat.name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), price: Faker::Number.decimal(l_digits: 2), image_url: images_array[i-1])
end