module ApplicationHelper
  # 最後のログインから作られたニュースがあるか
  def has_news_since_last_login_on?
    return News.exists?(["created_on > ? and project_id in (?)", User.current.last_before_access_on, Project.visible.collect(&:id)])
  end

  # 最後のログインから作られたニュースの数を取得する
  def count_news_since_last_login_on
    return News.count('id', :conditions => ["created_on > ? and project_id in (?)", User.current.last_before_access_on, Project.visible.collect(&:id)])
  end
end
