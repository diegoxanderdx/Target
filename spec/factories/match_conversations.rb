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
    user1_id { 1 }
    user2_id { 1 }
    target_id { 1 }
  end
end
