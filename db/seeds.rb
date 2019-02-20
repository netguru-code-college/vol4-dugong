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
50.times do
  user = User.new
  user.username = Faker::Name.first_name
  user.email = Faker::Internet.email(user.username)
  user.password = 'asdjkl'
  user.save!
end

good_titles = [
  'Yes!', 'Hurra!', 'This is really cool!', ':)', 'Nice!', 'Landed a job!',
  ':D', 'Best thing ever!', 'Happy!', 'Proud...', 'LOL', 'I feel lucky'
]
bad_titles = [
  'Oh no!', 'Shit!', 'Fu*k', 'Help', ':(', ';(', 'Nein!', ':[',
  'Of course!', 'This sucks!', 'Worst day ever', 'Yikes!', 'Noooo',
  ':(((((', 'OMG!', 'Oh my god!', 'I am so lucky :/', 'You wont believe',
  'Just my luck', 'Sutpid Boss', 'Dead Cat'
]

ar_gdpath = []
ar_bdpath = []
path = 'app/assets/images/'
num_of_pictures = 8
num_of_pictures.times do |i|
  ar_gdpath[i] = [path + 'good/' + (i + 1).to_s + '.jpg', (i + 1).to_s + '.jpg']
  ar_bdpath[i] = [path + 'bad/' + (i + 1).to_s + '.jpg', (i + 1).to_s + '.jpg']
end

# BADSTORIES:
User.all.each do |user|
  rand(0..3).times do
    rork = rand(0...num_of_pictures)
    story = Story.new
    story.title = bad_titles.sample
    story.text = Faker::Quotes::Shakespeare.hamlet_quote
    story.picture.attach(io: File.open(ar_bdpath[rork].first), filename: ar_bdpath[rork].second, content_type: 'image/jpg')
    story.user_id = user.id
    story.category_id = 1
    story.save!
  end
end

# GOODSTORIES:
User.all.each do |user|
  rand(0..3).times do
    rork = rand(0...num_of_pictures)
    story = Story.new
    story.title = good_titles.sample
    story.text = Faker::Movies::Lebowski.quote
    story.picture.attach(io: File.open(ar_gdpath[rork].first), filename: ar_gdpath[rork].second, content_type: 'image/jpg')
    story.user_id = user.id
    story.category_id = 2
    story.save!
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
