# == Schema Information
#
# Table name: match_conversations
#
#  id         :bigint           not null, primary key
#  user1_id   :integer
#  user2_id   :integer
#  target_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :match_conversation do
    target

    association :user1, factory: :user
    association :user2, factory: :user
  end
end
