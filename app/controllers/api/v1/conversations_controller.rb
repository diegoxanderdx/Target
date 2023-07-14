module Api
  module V1
    class ConversationsController < Api::V1::ApiController
      def index
        @conversations = policy_scope(user_conversations)
                         .includes(:messages, user1: :avatar_attachment, user2: :avatar_attachment)
      end

      private

      def user_conversations
        Conversation.where(user1: current_user).or(Conversation.where(user2: current_user))
      end
    end
  end
end
