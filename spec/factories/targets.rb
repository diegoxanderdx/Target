# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#  title      :string           not null
#  radius     :decimal(, )      not null
#  latitude   :decimal(, )      not null
#  longitude  :decimal(, )      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#
FactoryBot.define do
  factory :target do
    topic { Faker::Number.non_zero_digit }
    user { Faker::Number.non_zero_digit }
    title { Faker::Lorem.sentence(word_count: 3) }
    radius { Faker::Number.decimal(l_digits: 2) }
    latitude { Faker::Number.decimal(l_digits: 3, r_digits: 4) }
    longitude { Faker::Number.decimal(l_digits: 3, r_digits: 4) }
  end
end
