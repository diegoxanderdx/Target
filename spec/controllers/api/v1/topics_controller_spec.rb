require 'rails_helper'

RSpec.describe Api::V1::TopicsController, type: :controller do
  describe 'with user logged in' do
    let!(:topics)       { create_list(:topic, 4) }
    login_user
    
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "returns a success response" do
      get 'index'
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(response).to be_successful
    end

    it "should return all topics" do
      get 'index'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(topics.size)
      expect(response).to be_successful
    end
  end

  describe 'with not user logged in' do
    let!(:topics)       { create_list(:topic, 4) }
    
    it "should not have a current_user" do
      expect(subject.current_user).to eq(nil)
    end

    it "returns a not authorized response" do
      get 'index'
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(response).to be_unauthorized
    end

    it "should not return all topics" do
      get 'index'
      payload = JSON.parse(response.body)
      expect(payload.size).to_not eq(topics.size)
      expect(response).to be_unauthorized
    end
  end
end
