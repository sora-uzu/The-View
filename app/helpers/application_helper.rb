module ApplicationHelper
  def current_user?(user)
    user == current_user
  end

  def created_date(object)
    object.created_at.strftime('%m月%d日')
  end
end
