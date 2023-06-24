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
      end

      def destroy
        return if @target.blank?

        @target = current_user.targets.find(params[:id])
        authorize @target
        @target.destroy!
      end

      private

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :latitude, :longitude)
      end
    end
  end
end
