module Api
  module V1
    class TopicsController < Api::V1::ApiController
      skip_after_action :verify_policy_scoped
      after_action :verify_authorized, only: :index

      def index
        authorize Topic
        @topics = Topic.all
        render json: @topics
      end
    end
  end
end
