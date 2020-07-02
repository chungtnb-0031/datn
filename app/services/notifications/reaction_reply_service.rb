class Notifications::ReactionReplyService
  def initialize reaction
    @reaction = reaction
  end

  def perform
    ActivityNotification::Notification.notify :users, @reaction, key: "reaction.reply", notifier: @reaction.user, group: @reaction.post
    notification_targets(@reaction, "reaction.reply").each do |target_user|
      ReactionReplyBroadcastJob.perform_later target_user
    end
  end

  private

  def notification_targets reaction, _key
    ([reaction.post.user] - [reaction.user]).uniq
  end
end
