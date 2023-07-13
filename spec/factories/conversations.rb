# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  user1      :integer          not null
#  user2      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_conversations_on_user1_and_user2  (user1,user2) UNIQUE
#
FactoryBot.define do
  factory :conversation do
    association :user1, factory: :user
    association :user2, factory: :user
  end
end
