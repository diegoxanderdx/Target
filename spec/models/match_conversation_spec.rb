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
require 'rails_helper'

RSpec.describe MatchConversation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
