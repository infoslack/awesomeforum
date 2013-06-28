module ApplicationHelper
  def recent_users
    User.order("created_at desc").limit(20)
  end
end
