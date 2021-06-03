# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

UserGoal.destroy_all
Goal.destroy_all
ChallengeUser.destroy_all
Challenge.destroy_all
Friendship.destroy_all
User.destroy_all



puts "** Let's create some users for my2022 **"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617603749/da22yjwdbfkl4uq8cqvy.jpg')
jonas = User.new(email: "jonas@jonas.com", password: "123456", first_name: "Jonas", last_name: "Wagon")
jonas.photo.attach(io: file, filename: 'jonas.jpg', content_type: 'image/jpg')
jonas.save!
puts "#{jonas.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617604976/nuur2wmzwub7k9xcgd5f.jpg')
caterina = User.new(email: "caterina@caterina.com", password: "123456", first_name: "Caterina", last_name: "Wagon")
caterina.photo.attach(io: file, filename: 'caterina.jpg', content_type: 'image/jpg')
caterina.save!
puts "#{caterina.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617972092/txqoasjgslma5y22gfdu.jpg')
silke = User.new(email: "silke@silke.com", password: "123456", first_name: "Silke", last_name: "Wagon")
silke.photo.attach(io: file, filename: 'silke.jpg', content_type: 'image/jpg')
silke.save!
puts "#{silke.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617954179/ojiticlbou6iocwbqeje.jpg')
seb = User.new(email: "seb@seb.com", password: "123456", first_name: "Sebastian", last_name: "Wagon")
seb.photo.attach(io: file, filename: 'seb.jpg', content_type: 'image/jpg')
seb.save!
puts "#{seb.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1596118942/yvkorthmlicxnuag0szm.jpg')
max = User.new(email: "max@max.com", password: "123456", first_name: "Max", last_name: "Wagon")
max.photo.attach(io: file, filename: 'max.jpg', content_type: 'image/jpg')
max.save!
puts "#{max.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601461074/xrbi2mzjyawsdisknhdd.jpg')
santi = User.new(email: "santi@santi.com", password: "123456", first_name: "Santi", last_name: "Wagon")
santi.photo.attach(io: file, filename: 'santi.jpg', content_type: 'image/jpg')
santi.save!
puts "#{santi.first_name} was created. What a great user!"

file = URI.open('https://avatars.githubusercontent.com/u/37805251?v=4')
val = User.new(email: "val@val.com", password: "123456", first_name: "Valerie", last_name: "Wagon")
val.photo.attach(io: file, filename: 'val.jpg', content_type: 'image/jpg')
val.save!
puts "#{val.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617958938/yniyzgmayab38bubnpjb.jpg')
dave = User.new(email: "david@david.com", password: "123456", first_name: "David", last_name: "Wagon")
dave.photo.attach(io: file, filename: 'dave.jpg', content_type: 'image/jpg')
dave.save!
puts "#{dave.first_name} was created. What a great user!"

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

goal1 = Goal.new(challenge: challenge1, name: "Eat apples", target_amount: rand(150), unit: "pieces", goal_type: :min_amount)
goal1.save!
puts "The goal << #{goal1.name} (#{goal1.goal_type} #{goal1.target_amount} #{goal1.unit}) >> was added to the challenge."

# add minmax

goal2 = Goal.new(challenge: challenge1, name: "Play Codewars", target_amount: rand(75), unit: "hours", goal_type: :min_amount)
goal2.save!
puts "The goal << #{goal2.name} (#{goal2.goal_type} #{goal2.target_amount} #{goal2.unit}) >> was added to the challenge."

goal3 = Goal.new(challenge: challenge1, name: "Smoke", target_amount: rand(100), unit: "ciggarettes", goal_type: :max_amount)
goal3.save!
puts "The goal << #{goal3.name} (#{goal3.goal_type} #{goal3.target_amount} #{goal3.unit}) >> was added to the challenge."

puts ""

puts "*** Now let's see, how everyone is performing... ***"

challenge1.users.each do |user|
  challenge1.goals.each do |goal|
    amount = rand(0...goal.target_amount)
    UserGoal.create(user: user, goal: goal, current_amount: amount)
  end
end

puts "/// USER PROGRESS TO BE ADDED ///"

puts "** Now let's build a 2nd challenge **"

challenge2 = Challenge.create(name: "Summer Sports", description: "Let's get rid of our lockdown fat and in Shape for our September Holidays", start_date: "01.05.2021", end_date: "01.09.2021", user: User.all.sample)
challenge2.save!
puts "The challenge with the fancy name << #{challenge2.name} >> was created by #{challenge2.user.first_name}. It starts at #{challenge2.start_date} and ends at #{challenge2.end_date}."

puts ""

puts "** Let's see, which friends will be joining #{challenge2.user.first_name} for the challenge ***"

ChallengeUser.create(challenge: challenge2, user: challenge2.user)

rand(2...User.count).times do |iteration|
  # find random user and add to challenge if not yet assigned
  member = User.all.sample
  # ChallengeUser.find_by(challenge: challenge1, user: member)
  ChallengeUser.find_or_create_by(challenge: challenge2, user: member)
  puts "#{member.first_name} joined the challenge"
end


puts ""

puts "** Now let's add some GOALS to the challenge << #{challenge2.name} >>**"

goal21 = Goal.new(challenge: challenge2, name: "Pushups", target_amount: rand(5000), unit: "times", goal_type: :min_amount)
goal21.save!
puts "The goal << #{goal21.name} (#{goal21.goal_type} #{goal21.target_amount} #{goal21.unit}) >> was added to the challenge."

goal22 = Goal.new(challenge: challenge2, name: "Running", target_amount: rand(500), unit: "km", goal_type: :min_amount)
goal22.save!
puts "The goal << #{goal22.name} (#{goal22.goal_type} #{goal22.target_amount} #{goal22.unit}) >> was added to the challenge."

goal23 = Goal.new(challenge: challenge2, name: "Fasting (No food!)", target_amount: rand(30), unit: "days", goal_type: :min_amount)
goal23.save!
puts "The goal << #{goal23.name} (#{goal23.goal_type} #{goal23.target_amount} #{goal23.unit}) >> was added to the challenge."

puts ""

challenge2.users.each do |user|
  challenge2.goals.each do |goal|
    amount = rand(0...goal.target_amount)
    UserGoal.create(user: user, goal: goal, current_amount: amount)
  end
end

# date = challenge1.start_date
# current_date = Date.Now

# while date < current_date
#   challenge1.user



#   date = date + 1
#   puts

# end













