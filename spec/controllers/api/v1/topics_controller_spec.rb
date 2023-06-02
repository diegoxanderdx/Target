require 'rails_helper'

RSpec.describe Api::V1::TopicsController, type: :controller do
  describe 'with user logged in' do
    let!(:topics) { create_list(:topic, 4) }
    login_user

    before(:example) do
      get 'index'
    end

    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end

    it 'should return all topics' do
      expect(payload).to_not be_empty
      expect(payload.size).to eq(topics.size)
      expect(response).to be_successful
    end
  end

  describe 'with not user logged in' do
    let!(:topics) { create_list(:topic, 4) }

    before(:each) do
      get 'index'
    end

    it 'should not have a current_user' do
      expect(subject.current_user).to eq(nil)
    end

    it 'returns a not authorized response' do
      expect(response).to be_unauthorized
    end
  end
end
