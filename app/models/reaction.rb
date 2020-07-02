class Reaction < ApplicationRecord
  belongs_to :reaction_type
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :reaction_type_id, presence: true
  validates :post_id, presence: true, uniqueness: {
    scope: :user_id
  }

  scope :get_like, ->(reaction_type_id, post_id){where "reaction_type_id = ? and post_id =?", reaction_type_id, post_id}

  acts_as_notifiable :users,
    targets: ->(reaction, _key){([reaction.post.user] - [reaction.user]).uniq},
    notifiable_path: :post_notificable_path

  private

  def post_notificable_path
    posts_show_path id: post.id
  end
end
