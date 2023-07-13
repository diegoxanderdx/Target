# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  message         :string           not null
#  user_id         :bigint           not null
#  conversation_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_user_id          (user_id)
#
FactoryBot.define do
  factory :message do
    message { Faker::Lorem.sentence }
    association :user, factory: :user
    association :conversation, factory: :conversation
  end
end
