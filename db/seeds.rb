require "faker"

puts 'Cleaning database...'
Review.destroy_all
Payment.destroy_all
Task.destroy_all
User.destroy_all

address_task = ["5 Via Tolomeo, Milano",
  "52 Corso Magenta, Milano",
  "23 Via Polibio, Milano",
  "51 Via Leone Tolstoi, Milano",
  "12 Piazza del Duomo, Milano"]

#### USERS #####################################

puts 'Creating user : John Rambo'
test_user = User.new(
    first_name: "John",
    last_name: "Rambo",
    address: "Via Antonio Tolomeo Trivulzio, 14, Milano, Metropolitan City of Milan",
    email: "test@test.com",
    phone_number: "+39 320 345678",
    password: "‭123456",
    avatar: "",
    bio: "I like hard job!"
    )
    test_user.remote_avatar_url = "https://aa1a5178aef33568e9c4-a77ea51e8d8892c1eb8348eb6b3663f6.ssl.cf5.rackcdn.com/p/full/446f5b44-1ba0-43ac-a8bf-ddd709cc8996.jpg"
  test_user.save

puts 'Creating user : Nicolas'
test_user = User.new(
    first_name: "Nicolas",
    last_name: "Lequeux",
    address: "52 Corso Magenta, Milan",
    email: "contact@nicolaslequeux.com",
    phone_number: "‭+39 320 123456",
    password: "123",
    avatar: "",
    bio: "Looking for electrical works"
    )
    test_user.remote_avatar_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553688302/works4me-seed/Nicolas_Lequeux.jpg"
  test_user.save

puts 'Creating user : Honza'
test_user = User.new(
    first_name: "Honza",
    last_name: "Ranostaj",
    address: "32 Via Polibio, Milano",
    email: "honzaranostaj@gmail.com",
    phone_number: "‭+39 320 234567",
    password: "123",
    avatar: "",
    bio: "Good at fixing computers!"
    )
    test_user.remote_avatar_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553693926/works4me-seed/honza.jpg"
  test_user.save

puts 'Creating user : Ivano'
test_user = User.new(
    first_name: "Ivano",
    last_name: "Panizza",
    address: "51 Via Leone Tolstoi, Milano",
    email: "ivano.panizza@libero.it",
    phone_number: "‭+39 320 294567",
    password: "123",
    avatar: "",
    bio: ""
    )
    test_user.remote_avatar_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553695180/works4me-seed/ivano_panizza.png"
  test_user.save

#### TASKS WITH NO WORKER #####################################

new_task = Task.new(
  name: "Cleaning kitchen",
  category: "Cleaning",
  description: "Kichen to clean up after a party of 8 people. Estimate cleaning time 2h30",
  price: 25,
  address: address_task.sample,
  picture: "",
  owner_user_id: User.all.sample.id,
  # worker_user_id: User.all.sample.id
  )
  new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697141/works4me-seed/dirty_kitchen_1.jpg"
new_task.save
puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."


new_task = Task.new(
  name: "Cleaning a 4x4 car",
  category: "Cleaning",
  description: "Car to clean inside out",
  price: 50,
  address: "22 Alzaia Naviglio Pavese, Moirago",
  picture: "",
  owner_user_id: User.all.sample.id,
  # worker_user_id: User.all.sample.id
  )
  new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697141/works4me-seed/dirty_car_1.jpg"
new_task.save
puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."

new_task = Task.new(
  name: "Cleaning a van car",
  category: "Cleaning",
  description: "Clean the outside part only.",
  price: 37,
  address: "21 Via Luigi Mancinelli, Milano",
  picture: "",
  owner_user_id: User.all.sample.id,
  # worker_user_id: User.all.sample.id
  )
  new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697141/works4me-seed/dirty_car_2.jpg"
new_task.save
puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."


new_task = Task.new(
  name: "Cut grass",
  category: "Gardening",
  description: "Small garden, estimate time 2h",
  price: 25,
  address: "12 Viale Addetta, Tribiano",
  picture: "",
  owner_user_id: User.all.sample.id,
  # worker_user_id: User.all.sample.id
  )
  new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697141/works4me-seed/cut_grass_1.jpg"
new_task.save
puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."

new_task = Task.new(
  name: "Moving",
  category: "Moving",
  description: "Furnitures to be uploaded in a truck. Flat at the 2nd floor.",
  price: 45,
  address: "2 Via Giuditta Pasta, Milano",
  picture: "",
  owner_user_id: User.all.sample.id,
  # worker_user_id: User.all.sample.id
  )
  new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697142/works4me-seed/moving-furniture-0.jpg"
new_task.save
puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."

new_task = Task.new(
  name: "Moving",
  category: "Moving",
  description: "Furnitures to be moved in the same buidling form 1st to 5th floor.",
  price: 55,
  address: address_task.sample,
  picture: "",
  owner_user_id: User.all.sample.id,
  # worker_user_id: User.all.sample.id
  )
  new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697141/works4me-seed/moving_furniture_1.jpg"
new_task.save
puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."


new_task = Task.new(
  name: "Upgrading computer",
  category: "Computering",
  description: "I need to replace the hard drive of my MacBook Pro.",
  price: 75,
  address: address_task.sample,
  picture: "",
  owner_user_id: User.all.sample.id,
  # worker_user_id: User.all.sample.id
  )
  new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697142/works4me-seed/repair_computer_1.jpg"
new_task.save
puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."


#### TASKS WITH WORKER #####################################

# new_task = Task.new(
#   name: "Reparing a computer",
#   category: "Computering",
#   description: "My computer need to be fixed",
#   price: 65,
#   address: address_task.sample,
#   picture: "",
#   owner_user_id: User.all.sample.id,
#   worker_user_id: User.all.sample.id
#   )
#   new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697142/works4me-seed/repair_computer_2.jpg"
# new_task.save
# puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."


# new_task = Task.new(
#   name: "Clothes to iron",
#   category: "Ironingg",
#   description: "3h ironing, steam iron provided",
#   price: 35,
#   address: address_task.sample,
#   picture: "",
#   owner_user_id: User.all.sample.id,
#   worker_user_id: User.all.sample.id
#   )
#   new_task.remote_picture_url = "https://res.cloudinary.com/dapwf6rtd/image/upload/v1553697142/works4me-seed/iron_1.jpg"
# new_task.save
# puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."



#
#name_task = ["Cleaning", "Moving furnitures", "Driving", "Digging a hole", "Ironing"]
#category_task = ["Cleaning", "moving", "driving", "ironing", "sewing", "computering"]
#status_task = ["pending", "accepted", "refused", "in progress", "resolved", "unresolved", "canceled", "finished"]
#address_task = ["Rome", "Milan", "Paris", "Madrid", "Berlin", "London", "Brussels"]
#
#
# puts 'Creating Users...'
# 5.times do
#   new_user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: Faker::Address.full_address,
#     email: Faker::Internet.email,
#     phone_number: Faker::PhoneNumber.phone_number_with_country_code,
#     password: "123456",
#     avatar: ""
#     )
#     new_user.remote_avatar_url = "https://lorempixel.com/200/200/?random"
#   new_user.save
#   puts "#{new_user} - #{new_user.first_name} #{new_user.last_name} has been created as a #{new_user.valid?} user."
# end


# puts 'Creating Tasks... with worker'
# 5.times do
#   new_task = Task.new(
#     name: name_task.sample,
#     category: category_task.sample,
#     description: Faker::Lorem.paragraphs,
#     price: Faker::Commerce.price,
#     address: address_task.sample,
#     # status: status_task.sample,
#     picture: "",
#     owner_user_id: User.all.sample.id,
#     worker_user_id: User.all.sample.id
#     )
#     new_task.remote_picture_url = "https://lorempixel.com/200/300/?random"
#   new_task.save
#   puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."
# end

# puts 'Creating Tasks... with NO worker'
# 5.times do
#   new_task = Task.new(
#     name: name_task.sample,
#     category: category_task.sample,
#     description: Faker::Lorem.paragraphs,
#     price: Faker::Commerce.price,
#     address: address_task.sample,
#     # status: status_task.sample,
#     picture: "",
#     owner_user_id: User.all.sample.id,
#     # worker_user_id: User.all.sample.id
#     )
#     new_task.remote_picture_url = "https://lorempixel.com/200/300/?random"
#   new_task.save
#   puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."
# end

# puts "Creating Reviews..."
# 20.times do
#   new_review = Review.new(
#     rating: rand(1..5),
#     task_id: Task.all.sample.id,
#     user_id: User.all.sample.id
#     )
#   new_review.save
#   puts "#{new_review} with rating #{new_review.rating} has been created as a #{new_review.valid?} review."
# end


