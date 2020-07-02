module UsersHelper
  def gravatar_for user, options = {size: Settings.user.gravatar_size}
    width = options[:size]
    height = options[:size]
    avatar_url = if user.avatar?
                   user.avatar.url
                 elsif user.image?
                   user.image
                 else
                   Settings.default_avatar
                 end
    image_tag avatar_url,
      alt: user.username,
      class: "gravatar rounded-circle hidden",
      id: "img_prev",
      width: width,
      height: height
  end
end
