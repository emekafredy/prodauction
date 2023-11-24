# frozen_string_literal: true

module HomeHelper
  def user_avatar(user)
    if user.avatar.present?
      image_tag(user.avatar, class: 'h-8 w-8 cursor-pointer rounded-full')
    else
      image_tag('user.svg', class: 'h-8 w-8 cursor-pointer rounded-full')
    end
  end
end
