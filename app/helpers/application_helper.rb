module ApplicationHelper
  def image_for(user, className)
    if user.image
      image_tag "/user_images/#{user.image}", class: className
    else
      image_tag "no_image.png", class: className
    end
  end
end
