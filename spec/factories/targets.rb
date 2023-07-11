# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#  title      :string           not null
#  radius     :float            not null
#  latitude   :float            not null
#  longitude  :float            not null
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
    title { Faker::Lorem.sentence(word_count: 3) }
    radius { Faker::Number.between(from: 1.0, to: 600_000.0).round(2) }
    latitude { Faker::Number.decimal(l_digits: 2, r_digits: 6) }
    longitude { Faker::Number.decimal(l_digits: 2, r_digits: 6) }
    association :user, factory: :user
    association :topic, factory: :topic
  end
end
