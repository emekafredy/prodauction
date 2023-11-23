# frozen_string_literal: true

module HomeHelper
  def user_avatar(user)
    if user.avatar.present?
      image_tag(user.avatar, class: 'h-6 cursor-pointer')
    else
      image_tag('user.svg', class: 'h-6 cursor-pointer')
    end
  end
end
