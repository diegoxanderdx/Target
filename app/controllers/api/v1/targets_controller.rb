module Api
  module V1
    class TargetsController < Api::V1::ApiController
      def index
        @targets = policy_scope(current_user.targets)
        render json: @targets
      end

      def create
        authorize Target
        @target = current_user.targets.build(target_params)

        if @target.save
          @matches = MatchService.new(@target, current_user).perform
          render json: @target
        else
          render json: { errors: @target.errors }, status: :unprocessable_entity
        end
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
