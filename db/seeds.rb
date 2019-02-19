# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w(bad good)
categories.each { |category| Category.create(name: category)}

#OURUSER
user = User.new
user.username = 'dude'
user.email = 'dude@dude.com'
user.password = 'asdjkl'
user.save!

#USERS:
19.times do
  user = User.new
  user.username = Faker::Name.first_name
  user.email = Faker::Internet.email(user.username)
  user.password = 'asdjkl'
  user.save!
end

good_titles = [
  "Yes!", "Hurra!", "This is really cool!", ":)", "Nice!", "Landed a job!",
  ":D", "Best thing ever!", "Happy!", "Proud...", "LOL", "I feel lucky"
]
bad_titles = [
  "Oh no!", "Shit!", "Fu*k", "Help", ":(", ";(", "Nein!", ":[",
  "Of course!", "This sucks!", "Worst day ever", "Yikes!", "Noooo",
  ":(((((", "OMG!", "Oh my god!", "I am so lucky :/", "You wont believe",
  "Just my luck", "Sutpid Boss", "Dead Cat"
]

#BADSTORIES:
User.all.each do |user|
    rand(2..10).times do
    story = Story.new
    story.title = bad_titles.sample
    story.text = Faker::Quotes::Shakespeare.hamlet_quote
    story.picture = nil
    story.user_id = user.id
    story.category_id = 1
    story.save!
  end
end

#GOODSTORIES:
User.all.each do |user|
    rand(1..5).times do
    story = Story.new
    story.title = good_titles.sample
    story.text = Faker::Movies::Lebowski.quote
    story.picture = nil
    story.user_id = user.id
    story.category_id = 2
    story.save!
  end
end
