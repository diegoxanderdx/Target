module Api
  module V1
    class TopicsController < Api::V1::ApiController
      def index
        @topics = policy_scope(Topic)
        render json: @topics
      end
    end
  end
end
