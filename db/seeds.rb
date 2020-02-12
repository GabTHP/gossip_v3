# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipAndTag.destroy_all
Comment.destroy_all
Like.destroy_all

PrivateMessage.destroy_all

#CITIES
# To have the city name and zip code equals, I tried to use the gem geokit and zipcode with no success
count = 0
10.times do 
    count += 1
    City.create(id: count, name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

#USERS
# I used the same f and l name for email
count = 0
10.times do
    count += 1
    f_name = Faker::Name.first_name
    l_name = Faker::Name.last_name
    User.create(id: count, first_name: f_name, last_name: l_name, description: Faker::Movie.quote, email: "#{f_name.downcase}.#{l_name.downcase}@gmail.com", age: rand(10..30), city: City.find(rand(1..10))) 
end

#GOSSIPS
count = 0
20.times do 
    count += 1
    Gossip.create(id: count, title: Faker::Book.title, content: "Apparently, #{Faker::TvShows::GameOfThrones.character} said to #{Faker::TvShows::GameOfThrones.character}: '#{[Faker::TvShows::Friends.quote, Faker::TvShows::RuPaul.quote].sample}'", user: User.find(rand(1..10)))
end

#TAGS
count = 0
10.times do 
    count += 1
    Tag.create(id: count, title: "##{[Faker::Games::Pokemon.name, Faker::Creature::Animal.name, Faker::Music.genre].sample}")
end

#GOSSIPS AND TAGS
#The join table for gossips and tags
count = 0
count_gossips = 0
20.times do  #I had to give one tag to each gossip first
    count += 1
    count_gossips += 1
    GossipAndTag.create(id: count, gossip: Gossip.find(count_gossips), tag: Tag.find(rand(1..10)))
end
20.times do #then giving extra tags to random gossips
    count += 1
    count_gossips += 1
    GossipAndTag.create(id: count, gossip: Gossip.find(rand(1..20)), tag: Tag.find(rand(1..10)))
end

#PrivateMessage
count = 0
10.times do
    count += 1
    a = PrivateMessage.create(id: count, content: "#{Faker::TvShows::Simpsons.quote}", sender: User.find(rand(1..10)), recipient: User.find(rand(1..10)))
    while a.sender == a.recipient do #in order to not have a sender sending a message to himself
        a.update(recipient: User.find(rand(1..10)))
    end
end

#Comments
count = 0
20.times do
    count += 1
    Comment.create(id: count, content: ["OMG", "LMFAO", "XD", "PTDR", "XDPTDR", "GROSS", "c nul"].sample, gossip: Gossip.find(rand(1..20)), user: User.find(rand(1..10))) 
end

#Likes
#We have to give a like to a gossip OR a comment (not both)
count = 0
20.times do 
    count += 1 
    a = rand(1..2)
    if a == 1 then 
        b = rand(1..10)
        c = 0 
    else
        b = 0
        c = rand(1..10)
    end
    Like.create(id: count, user: User.find(rand(1..10)), comment: Comment.find_by(id: b), gossip: Gossip.find_by(id: c))
    #Example : if b == 0 then 
    #Comment.find_by(0) will return nil
    #so there are no entries for the comment (it is possible with "optional: true" in the like.rb)
    #but we will have an entry for gossip because c will be an id between 1 and 10
end
puts "Seeds loaded"
