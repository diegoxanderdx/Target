# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Topic do
  describe 'validations' do
    subject { build :topic }

    it 'validate presence of required fields' do
      expect(subject).to validate_presence_of(:name)
    end

    it 'validates that an icon is attached' do
      subject.icon.detach
      subject.valid?
      expect(subject.errors[:icon]).to include('must be attached')
    end
  end

  describe 'Associations' do
    it { should have_many(:targets) }
  end
end
