module Api
  module V1
    class ConversationsController < Api::V1::ApiController
      def index
        @conversations = policy_scope(Conversation.where(user1: current_user)
                                      .or(Conversation.where(user2: current_user)))
                         .includes(:user1, :user2)
      end
    end
  end
end
