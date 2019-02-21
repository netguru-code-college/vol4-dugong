# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w[bad good]
categories.each { |category| Category.create(name: category) }

# OURUSER
user = User.new
user.username = 'dude'
user.email = 'dude@dude.com'
user.password = 'asdjkl'
user.save!

# USERS:
60.times do
  user = User.new
  user.username = Faker::Name.first_name
  user.email = Faker::Internet.email(user.username)
  user.password = 'asdjkl'
  user.save!
end

#Locations
30.times do |n|
  lat = rand(5004..5343)/100
  long = rand(1455..2200)/100
  city_name = Geocoder.search("#{lat},#{long}").first.city
  city_name = "almost nowhere" if city_name.nil?
  city = City.where(name: city_name).first || City.create(name: city_name)
   Location.create(latitude: lat, longitude: long, city: city)
end

good_titles = [
  'Yes!', 'Hurray!', 'This is really cool!', ':)', 'Nice!', 'Landed a job!',
  ':D', 'Best day ever!', 'Happy!', 'Proud.', 'LOL', 'Lucky','Landed kick-flip',
  'Half-life 3 comming', ':))))))', 'Won Contest!', 'Awesome!', 'Beautiful day', 'A welcome sight',
  'Afternoon delight', 'Happy with my family', 'Colour me happy', "Don't worry, be happy",
  'Happy hour', 'In seventh heaven', 'Appetite for life', 'Dancing on air',
  'Perfect day', 'Hallelujah!', 'Heart warming', 'Holidays!!!', 'Promotion!',
  "You know what? I'm happy", 'Happy as a pig in muck', "couldn't be happier",
  "Good five-cent cigar", 'Good deal', 'Heart of gold'
]

bad_titles = [
  'Oh no!', 'Shit!', 'Fu*k', 'Help!!!', ':(', ';(', 'Nein!', ':[',
  'Of course!', 'This sucks!', 'Worst day ever', 'Yikes!', 'Noooo',
  'Broken toe', "Lost job", "Offically betrayed",
  ':(((((', "I can't stand it", 'Oh my god!', 'You wont believe :(',
  'Just my luck', 'Sutpid Boss', 'Dead Cat', 'Never satisfied',
  'How sad is that?', 'Long face', 'I hate it!', 'Feeling blue', 'Blue',
  'Sadder and wiser man', 'The deep blue sea', 'The low down', 'What a drag',
  'Out of the blue', 'Miserable specimen', "I'm A Loser",
  'A lump in the throat', 'Blue Monday', 'Broken man', 'Broken heart',
  'Depths of despair', 'Down in the dumps', 'Feeling blue', 'It burns me up',
  'Man Of Constant Sorrow', 'Reduced to tears', 'Sad sack'
]

require 'open-uri'

# BADSTORIES:
User.all.each do |user|
  if rand(2).zero?
    rand(0..1).times do
      story = Story.new
      story.title = bad_titles.sample
      story.text = Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote
      download = open('https://source.unsplash.com/320x240/?sad')
      story.picture.attach(io: download, filename: "story_img_#{story.id}.jpg")
      story.user_id = user.id
      story.location_id = rand(1..Location.count)
      story.category_id = 1
      story.save!
    end
  end
end

# GOODSTORIES:
User.all.each do |user|
  if rand(2).zero?
    rand(0..1).times do
      story = Story.new
      story.title = good_titles.sample
      story.text = Faker::Movies::Lebowski.quote
      download = open('https://source.unsplash.com/320x240/?happy')
      story.picture.attach(io: download, filename: "story_img_#{story.id}.jpg")
      story.user_id = user.id
      story.location_id = rand(1..Location.count)
      story.category_id = 2
      story.save!
    end
  end
end

# Comments
Story.all.each do |story|
  rand(10).times do
    story.comments.create(body: Faker::TvShows::SouthPark.quote, user_id: rand(1..User.count))
  end
end

# Votes
User.all.each do |user|
  Story.all.each do |story|
    story.votes.create(updown: rand(2).zero?, user_id: user.id) if rand(2).zero?
  end
end
