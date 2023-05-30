module Api
  module V1
    class TopicsController < Api::V1::ApiController

      def index
        @topics = topics.all
        render json: @topics
      end

      private

      #asign policy scope to @topics 
      def topics
        policy_scope(Topic)
      end
    end
  end
end
