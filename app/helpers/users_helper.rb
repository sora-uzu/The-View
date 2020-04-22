module UsersHelper
  def users_title
    if controller.action_name == "index"
      "Users"
    elsif controller.action_name == "following"
      "Following"
    elsif controller.action_name == "followers"
      "Followers"
    end
  end
end
