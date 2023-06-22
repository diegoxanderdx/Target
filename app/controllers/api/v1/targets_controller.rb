module Api
  module V1
    class TargetsController < Api::V1::ApiController
      def create
        authorize Target
        @target = current_user.targets.create!(target_params)
      end

      private

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :latitude, :longitude)
      end
    end
  end
end
