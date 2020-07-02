class PostImage < ApplicationRecord
  mount_uploader :link, PictureUploader

  belongs_to :post
  validates :post_id, presence: true
end
