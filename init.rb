require 'redmine'
require 'news_balloon_hook'
require 'news_balloon_user_patch'
require 'news_balloon_application_controller_patch'

Redmine::Plugin.register :redmine_news_balloon do
  name 'Redmine News Balloon plugin'
  author 'OZAWA Yasuhiro'
  description 'Notification new news.'
  version '0.0.1'
  url 'https://github.com/ameya86/redmine_news_balloon'
  author_url 'http://blog.livedoor.jp/ameya86/'
end
