class MatchService
  def initialize(target, user)
    @target = target
    @user = user
  end

  def perform
    matches = find_targets_within_radius
    create_conversations_with(matches)
    matches
  end

  private

  def find_targets_within_radius
    Target.within(@target.radius, origin: @target)
          .includes(:user)
          .where(topic: @target.topic)
          .where.not(user: @user)
  end

  def create_conversations_with(matches)
    matches.each do |target|
      target_user = target.user
      unless conversation_exists?(@user, target_user)
        Conversation.create!(user1: @user, user2: target_user)
      end
    end
  end

  def conversation_exists?(current_user, other_user)
    Conversation.exists?(user1: [current_user, other_user], user2: [current_user, other_user])
  end
end
