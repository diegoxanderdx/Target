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
        # byebug
        match_service = MatchService.new(@target, current_user)
        @matches = match_service.perform
      end

      def destroy
        @target = current_user.targets.find(params[:id])
        return if @target.blank?

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
