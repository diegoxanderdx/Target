module Api
  module V1
    class ConversationsController < Api::V1::ApiController
      def index
        @conversations = policy_scope(Conversation).includes(:user1, :user2)
      end
    end
  end
end
