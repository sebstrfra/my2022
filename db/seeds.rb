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
jonas = User.new(email: "jonas@jonas.com", password: "123456", first_name: "Jonas", last_name: "Hagedorn")
jonas.photo.attach(io: file, filename: 'jonas.jpg', content_type: 'image/jpg')
jonas.save!
puts "#{jonas.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617604976/nuur2wmzwub7k9xcgd5f.jpg')
caterina = User.new(email: "caterina@caterina.com", password: "123456", first_name: "Caterina", last_name: "Biffis")
caterina.photo.attach(io: file, filename: 'caterina.jpg', content_type: 'image/jpg')
caterina.save!
puts "#{caterina.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617972092/txqoasjgslma5y22gfdu.jpg')
silke = User.new(email: "silke@silke.com", password: "123456", first_name: "Silke", last_name: "Guthrie")
silke.photo.attach(io: file, filename: 'silke.jpg', content_type: 'image/jpg')
silke.save!
puts "#{silke.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617954179/ojiticlbou6iocwbqeje.jpg')
seb = User.new(email: "seb@seb.com", password: "123456", first_name: "Sebastian", last_name: "Strube")
seb.photo.attach(io: file, filename: 'seb.jpg', content_type: 'image/jpg')
seb.save!
puts "#{seb.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1596118942/yvkorthmlicxnuag0szm.jpg')
max = User.new(email: "max@max.com", password: "123456", first_name: "Max", last_name: "Keller")
max.photo.attach(io: file, filename: 'max.jpg', content_type: 'image/jpg')
max.save!
puts "#{max.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601461074/xrbi2mzjyawsdisknhdd.jpg')
santi = User.new(email: "santi@santi.com", password: "123456", first_name: "Santi", last_name: "Sanchez")
santi.photo.attach(io: file, filename: 'santi.jpg', content_type: 'image/jpg')
santi.save!
puts "#{santi.first_name} was created. What a great user!"

file = URI.open('https://avatars.githubusercontent.com/u/37805251?v=4')
val = User.new(email: "val@val.com", password: "123456", first_name: "Valerie", last_name: "Schraauwers")
val.photo.attach(io: file, filename: 'val.jpg', content_type: 'image/jpg')
val.save!
puts "#{val.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617958938/yniyzgmayab38bubnpjb.jpg')
dave = User.new(email: "david@david.com", password: "123456", first_name: "David", last_name: "Klören
  ")
dave.photo.attach(io: file, filename: 'dave.jpg', content_type: 'image/jpg')
dave.save!
puts "#{dave.first_name} was created. What a great user!"

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617870772/pllppuncxqixjiwdavjr.jpg')
soto = User.new(email: "soto@soto.com", password: "123456", first_name: "Soto", last_name: "Dimitriu")
soto.photo.attach(io: file, filename: 'soto.jpg', content_type: 'image/jpg')
soto.save!
puts "#{soto.first_name} was created. What a great user!"

file = URI.open('https://avatars.githubusercontent.com/u/80338339?v=4')
marnie = User.new(email: "marnie@marnie.com", password: "123456", first_name: "Marnie", last_name: "Nyenhuis")
marnie.photo.attach(io: file, filename: 'marnie.jpg', content_type: 'image/jpg')
marnie.save!
puts "#{marnie.first_name} was created. What a great user!"

puts "** #{User.count} beautiful users created! They will love the app! **"

puts ""

puts "Lets make some friendships"

friendship1 = Friendship.new(asker_id: jonas.id, receiver_id: seb.id, status: 1)
friendship1.save!

friendship1 = Friendship.new(asker_id: jonas.id, receiver_id: caterina.id, status: 1)
friendship1.save!

friendship1 = Friendship.new(asker_id: jonas.id, receiver_id: silke.id, status: 1)
friendship1.save!

friendship1 = Friendship.new(asker_id: jonas.id, receiver_id: marnie.id, status: 1)
friendship1.save!


puts ""

puts "** Now let's build a challenge **"

challenge1 = Challenge.new(name: "Surviving the bootcamp", description: "Let's not destroy our bodies tooo much while coding the whole day", start_date: "12.04.2021", end_date: "12.06.2021", user: jonas)
challenge1.save!
puts "The challenge with the fancy name << #{challenge1.name} >> was created by #{challenge1.user.first_name}. It starts at #{challenge1.start_date} and ends at #{challenge1.end_date}."

puts ""

puts "** Let's see, which friends will be joining #{challenge1.user.first_name} for the challenge ***"

ChallengeUser.create(challenge: challenge1, user: jonas)
ChallengeUser.create(challenge: challenge1, user: seb)
ChallengeUser.create(challenge: challenge1, user: silke)
ChallengeUser.create(challenge: challenge1, user: caterina)

puts ""

puts "** Now let's add some GOALS to the challenge << #{challenge1.name} >>**"

goal1 = Goal.new(challenge: challenge1, name: "Flashcard Practice", target_amount: 36, unit: "days", goal_type: :min_amount)
goal1.save!
puts "The goal << #{goal1.name} (#{goal1.goal_type} #{goal1.target_amount} #{goal1.unit}) >> was added to the challenge."

# add minmax

goal2 = Goal.new(challenge: challenge1, name: "Do sports", target_amount: 27, unit: "Sport Sessions", goal_type: :min_amount)
goal2.save!
puts "The goal << #{goal2.name} (#{goal2.goal_type} #{goal2.target_amount} #{goal2.unit}) >> was added to the challenge."

goal3 = Goal.new(challenge: challenge1, name: "Meet new people", target_amount: 32, unit: "new Person", goal_type: :min_amount)
goal3.save!
puts "The goal << #{goal3.name} (#{goal3.goal_type} #{goal3.target_amount} #{goal3.unit}) >> was added to the challenge."

goal4 = Goal.new(challenge: challenge1, name: "Rock the demo day", target_amount: 1, unit: "Demo Day rocked", goal_type: :min_amount)
goal4.save!
puts "The goal << #{goal4.name} (#{goal4.goal_type} #{goal4.target_amount} #{goal4.unit}) >> was added to the challenge."

puts ""

puts "*** Now let's see, how everyone is performing... ***"

UserGoal.create(user: jonas, goal: goal1, current_amount: 37)
UserGoal.create(user: seb, goal: goal1, current_amount: 20)
UserGoal.create(user: silke, goal: goal1, current_amount: 32)
UserGoal.create(user: caterina, goal: goal1, current_amount: 25)

UserGoal.create(user: jonas, goal: goal2, current_amount: 20)
UserGoal.create(user: seb, goal: goal2, current_amount: 12)
UserGoal.create(user: silke, goal: goal2, current_amount: 33)
UserGoal.create(user: caterina, goal: goal2, current_amount: 37)

UserGoal.create(user: jonas, goal: goal3, current_amount: 15)
UserGoal.create(user: seb, goal: goal3, current_amount: 45)
UserGoal.create(user: silke, goal: goal3, current_amount: 35)
UserGoal.create(user: caterina, goal: goal3, current_amount: 25)

UserGoal.create(user: jonas, goal: goal4, current_amount: 0)
UserGoal.create(user: seb, goal: goal4, current_amount: 0)
UserGoal.create(user: silke, goal: goal4, current_amount: 0)
UserGoal.create(user: caterina, goal: goal4, current_amount: 0)

puts "/// USER PROGRESS TO BE ADDED ///"

puts "** Now let's build a 2nd challenge **"

challenge2 = Challenge.create(name: "Life after bootcamp", description: "Let's make sure to keep crushing what we have learned", start_date: "11.06.2021", end_date: "08.09.2021", user: jonas)
challenge2.save!

ChallengeUser.create(challenge: challenge2, user: jonas)
ChallengeUser.create(challenge: challenge2, user: marnie)

goal21 = Goal.new(challenge: challenge2, name: "Revise Lectures", target_amount: 25, unit: "Lectures", goal_type: :min_amount)
goal21.save!
puts "The goal << #{goal21.name} (#{goal21.goal_type} #{goal2.target_amount} #{goal21.unit}) >> was added to the challenge."

goal22 = Goal.new(challenge: challenge2, name: "Play CSS Codewars", target_amount: 50, unit: "Hours", goal_type: :min_amount)
goal22.save!
puts "The goal << #{goal22.name} (#{goal22.goal_type} #{goal2.target_amount} #{goal22.unit}) >> was added to the challenge."

puts "*** Now let's see, how everyone is performing... ***"

UserGoal.create(user: jonas, goal: goal21, current_amount: 0)
UserGoal.create(user: jonas, goal: goal22, current_amount: 0)

UserGoal.create(user: marnie, goal: goal21, current_amount: 0)
UserGoal.create(user: marnie, goal: goal22, current_amount: 0)
