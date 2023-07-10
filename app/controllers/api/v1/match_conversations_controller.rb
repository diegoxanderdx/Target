module Api
  module V1
    class MatchConversationsController < Api::V1::ApiController
      def index
        @match_conversations = current_user.match_conversations
      end
    end
  end
end
