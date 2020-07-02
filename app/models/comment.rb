class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :create_desc, ->{order(created_at: :desc)}
  scope :list_post_comments, ->(post_id){where post_id: post_id}

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true

  acts_as_notifiable :users,
    targets: ->(comment, _key){([comment.post.user] + comment.post.commented_users.to_a - [comment.user]).uniq},
    notifiable_path: :post_notificable_path

  private

  def post_notificable_path
    posts_show_path id: post.id
  end
end
