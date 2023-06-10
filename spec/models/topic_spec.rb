# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:image)
    end
  end

  describe 'Associations' do
    it { should have_many(:targets) }
  end
end
