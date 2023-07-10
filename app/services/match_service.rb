class MatchService
  def initialize(target, user)
    @target = target
    @user = user
  end

  def perform
    matches = find_targets_within_radius
    create_match_conversations_with(matches)
    matches
  end

  private

  def find_targets_within_radius
    Target.within(@target.radius, origin: @target)
          .where(topic: @target.topic)
          .where.not(user: @user)
  end

  def create_match_conversations_with(matches)
    matches.each do |target|
      unless match_conversation_exists?(target.user, @user)
        MatchConversation.create!(user1: target.user, user2: @user)
      end
    end
  end

  def match_conversation_exists?(user1, user2)
    MatchConversation.exists?(user1: [user1, user2], user2: [user1, user2])
  end
end
