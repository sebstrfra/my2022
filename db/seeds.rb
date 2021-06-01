# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Goal.destroy_all
ChallengeUser.destroy_all
Challenge.destroy_all
User.destroy_all



puts "** Let's create some users for my2022 **"

jonas = User.new(email: "jonas@jonas.com", password: "123456", first_name: "Jonas", last_name: "Wagon")
jonas.save!
puts "#{jonas.first_name} was created. What a great user!"

caterina = User.new(email: "caterina@caterina.com", password: "123456", first_name: "Caterina", last_name: "Wagon")
caterina.save!
puts "#{caterina.first_name} was created. What a great user!"

silke = User.new(email: "silke@silke.com", password: "123456", first_name: "Silke", last_name: "Wagon")
silke.save!
puts "#{silke.first_name} was created. What a great user!"

seb = User.new(email: "seb@seb.com", password: "123456", first_name: "Sebastian", last_name: "Wagon")
seb.save!
puts "#{seb.first_name} was created. What a great user!"

max = User.new(email: "max@max.com", password: "123456", first_name: "Max", last_name: "Wagon")
max.save!
puts "#{max.first_name} was created. What a great user!"

santi = User.new(email: "santi@santi.com", password: "123456", first_name: "Santi", last_name: "Wagon")
santi.save!
puts "#{santi.first_name} was created. What a great user!"

val = User.new(email: "val@val.com", password: "123456", first_name: "Valerie", last_name: "Wagon")
val.save!
puts "#{val.first_name} was created. What a great user!"

puts "** #{User.count} beautiful users created! They will love the app! **"

puts ""

puts "The users are not yet friends - let's implement that later"

puts ""

puts "** Now let's build a challenge **"

challenge1 = Challenge.new(name: "Surviving the bootcamp", description: "Let's not destroy our bodies tooo much while coding the whole day", start_date: "12.04.2021", end_date: "12.06.2021", user: User.all.sample)
challenge1.save!
puts "The challenge with the fancy name << #{challenge1.name} >> was created by #{challenge1.user.first_name}. It starts at #{challenge1.start_date} and ends at #{challenge1.end_date}."

puts ""

puts "** Let's see, which friends will be joining #{challenge1.user.first_name} for the challenge ***"

ChallengeUser.create(challenge: challenge1, user: challenge1.user)

rand(2...User.count).times do |iteration|
  # find random user and add to challenge if not yet assigned
  member = User.all.sample
  # ChallengeUser.find_by(challenge: challenge1, user: member)
  ChallengeUser.find_or_create_by(challenge: challenge1, user: member)
  puts "#{member.first_name} joined the challenge"
end

puts ""

puts "** Now let's add some GOALS to the challenge << #{challenge1.name} >>**"

goal1 = Goal.new(challenge: challenge1, name: "Eat apples", target_amount: rand(150), unit: "pieces", goal_type: 1)
goal1.save!
puts "The goal << #{goal1.name} (#{goal1.target_amount} #{goal1.unit}) >> was added to the challenge."

# add minmax

goal2 = Goal.new(challenge: challenge1, name: "Play Codewars", target_amount: rand(75), unit: "hours", goal_type: 1)
goal2.save!
puts "The goal << #{goal2.name} (#{goal2.target_amount} #{goal2.unit}) >> was added to the challenge."

goal3 = Goal.new(challenge: challenge1, name: "Smoke", target_amount: rand(100), unit: "ciggarettes", goal_type: 2)
goal3.save!
puts "The goal << #{goal3.name} (#{goal3.target_amount} #{goal3.unit}) >> was added to the challenge."

puts ""

puts "/// NO MIN-MAX-DISTINCTION FOR GOALS YET /// - need to fix that later"

puts ""

puts "*** Now let's see, how everyone is performing... ***"

puts "/// USER PROGRESS TO BE ADDED ///"



# date = challenge1.start_date
# current_date = Date.Now

# while date < current_date
#   challenge1.user



#   date = date + 1
#   puts

# end













