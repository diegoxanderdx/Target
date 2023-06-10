module Api
  module V1
    class TargetsController < Api::V1::ApiController
      def index
        @targets = policy_scope(current_user.targets)
        render json: @targets
      end

      def create
        authorize Target
        @target = current_user.targets.create!(target_params)

        if @target.save
          render json: @target, status: :created, location: [:api, :v1, @target]
        else
          render json: @target.errors, status: :unprocessable_entity
        end
      end

      private

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :latitude, :longitude)
      end
    end
  end
end
