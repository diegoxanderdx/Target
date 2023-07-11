require 'faker'

AdminUser.create!(email: 'admin@example.com', password: 'password') if Rails.env.development?
Setting.create_or_find_by!(key: 'min_version', value: '0.0')
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    username: Faker::Internet.unique.user_name,
    password: 'password'
  )
end

5.times do
  Topic.create!(
    name: Faker::Lorem.unique.word,
    image: Faker::Internet.url
  )
end

10.times do
  Target.create!(
    user_id: User.all.sample.id,
    topic_id: Topic.all.sample.id,
    title: Faker::Lorem.sentence,
    radius: rand(1..100),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end
