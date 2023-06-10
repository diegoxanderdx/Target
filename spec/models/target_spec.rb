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
require 'rails_helper'

RSpec.describe Target, type: :model do
  describe 'Validations' do
    it 'validate required fields' do
      expect(subject).to validate_presence_of(:title)
      expect(subject).to validate_presence_of(:radius)
      expect(subject).to validate_presence_of(:latitude)
      expect(subject).to validate_presence_of(:longitude)
      expect(subject).to validate_numericality_of(:radius).is_greater_than(0)
      expect(subject).to validate_numericality_of(:latitude)
      expect(subject).to validate_numericality_of(:longitude)
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:topic) }
  end
end
