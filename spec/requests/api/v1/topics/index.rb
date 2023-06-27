describe 'GET api/v1/topics', type: :request do
  describe 'with user logged in' do
    let!(:topics) { create_list(:topic, 4) }

    login_user

    before do
      get 'index'
    end

    it 'has a current_user' do
      expect(subject.current_user).not_to be_nil
    end

    it 'returns all topics' do
      expect(payload).not_to be_empty
      expect(payload.size).to eq(topics.size)
    end

    it 'returns a successful response' do
        expect(response).to be_successful
      end

    it 'returns the correct format' do
      json_response = payload

      json_response.each do |topic|
        expect(topic.keys).to match_array(["id", "label", "icon"])
      end
    end
  end

  describe 'with user not logged in' do
    let!(:topics) { create_list(:topic, 4) }

    before do
      get 'index'
    end

    it 'does not have a current_user' do
      expect(subject.current_user).to be_nil
    end

    it 'returns a not authorized response' do
      expect(response).to be_unauthorized
    end
  end
end
