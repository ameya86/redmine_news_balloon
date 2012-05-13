class NewsBalloonHook < Redmine::Hook::ViewListener
  render_on :view_layouts_base_body_bottom, :partial => 'news_balloons/base_body_bottom'
end
