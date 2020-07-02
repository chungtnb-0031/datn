class Notifications::CommentReplyService
  def initialize comment
    @comment = comment
  end

  def perform
    ActivityNotification::Notification.notify :users, @comment, key: "comment.reply", notifier: @comment.user, group: @comment.post
    notification_targets(@comment, "comment.reply").each do |target_user|
      CommentReplyBroadcastJob.perform_later target_user
    end
  end

  private

  def notification_targets comment, _key
    ([comment.post.user] + comment.post.commented_users.to_a - [comment.user]).uniq
  end
end
