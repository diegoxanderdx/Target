module Api
  module V1
    class TopicsController < Api::V1::ApiController

      def index
        @topics = Topic.all
        render json: @topics
      end
    end
  end
end
