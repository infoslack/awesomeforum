module ApplicationHelper
  def recent_users
    User.order("created_at desc").limit(20)
  end

#  def user_link(user)
#    link_to user_path(user), class: "user" do
#      image_tag("avatar.jpg", class: "avatar") +
#        content_tag(:span, user.name, class: "name")
#    end
#  end
end
