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
      unless conversation_exists?(target.user, @user)
        Conversation.create!(user1: target.user, user2: @user)
      end
    end
  end

  def conversation_exists?(user1, user2)
    Conversation.exists?(user1: [user1, user2], user2: [user1, user2])
  end
end
