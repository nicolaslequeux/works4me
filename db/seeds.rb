require "faker"

puts 'Cleaning database...'
  Review.destroy_all
  Task.destroy_all
  User.destroy_all

puts 'Creating Users...'
5.times do
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    password: "123456",
    avatar: ""
    )
    new_user.remote_avatar_url = "https://lorempixel.com/200/200/?random"
  new_user.save
  puts "#{new_user} - #{new_user.first_name} #{new_user.last_name} has been created as a #{new_user.valid?} user."
end

puts 'Creating Test users John Rambo'
test_user = User.new(
    first_name: "John",
    last_name: "Rambo",
    address: "Milan",
    email: "test@test.com",
    password: "123456",
    avatar: ""
    )
    test_user.remote_avatar_url = "https://lorempixel.com/200/200/?random"
  test_user.save

name_task = ["Cleaning", "Moving furnitures", "Driving", "Digging a hole", "Ironing"]
category_task = ["Cleaning", "moving", "driving", "ironing", "sewing", "computering"]
status_task = ["pending", "accepeted", "refused", "resolved", "unresolved"]
address_task = ["Rome", "Milan", "Paris", "Madrid", "Berlin", "London", "Brussels"]

puts 'Creating Tasks... with worker'
5.times do
  new_task = Task.new(
    name: name_task.sample,
    category: category_task.sample,
    description: Faker::Lorem.paragraphs,
    price: Faker::Commerce.price,
    address: address_task.sample,
    # status: status_task.sample,
    picture: "",
    owner_user_id: User.all.sample.id,
    worker_user_id: User.all.sample.id
    )
    new_task.remote_picture_url = "https://lorempixel.com/200/300/?random"
  new_task.save
  puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."
end

puts 'Creating Tasks... with NO worker'
5.times do
  new_task = Task.new(
    name: name_task.sample,
    category: category_task.sample,
    description: Faker::Lorem.paragraphs,
    price: Faker::Commerce.price,
    address: address_task.sample,
    # status: status_task.sample,
    picture: "",
    owner_user_id: User.all.sample.id,
    # worker_user_id: User.all.sample.id
    )
    new_task.remote_picture_url = "https://lorempixel.com/200/300/?random"
  new_task.save
  puts "#{new_task} - #{new_task.name} has been created as a #{new_task.valid?} item."
end

puts "Creating Reviews..."
20.times do
  new_review = Review.new(
    rating: rand(1..5),
    task_id: Task.all.sample.id,
    user_id: User.all.sample.id
    )
  new_review.save
  puts "#{new_review} with rating #{new_review.rating} has been created as a #{new_review.valid?} review."
end


