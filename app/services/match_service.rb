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

  def conversation_exists?(first_user, second_user)
    Conversation.exists?(user1: [first_user, second_user], user2: [first_user, second_user])
  end
end
