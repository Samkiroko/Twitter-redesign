User.create!(full_name:  "Example User", username: 'exampleuser')

99.times do |n|
  full_name  = Faker::Name.name
  username = (full_name.split(' ')[0] + "#{n}").downcase
  User.create!(full_name: full_name, username: username)
end

users = User.order(:created_at)
3.times do
  text = Faker::Quote.matz
  users.each { |user| user.opinions.create!(text: text) }
end