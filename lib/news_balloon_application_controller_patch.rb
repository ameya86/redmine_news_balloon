require_dependency 'application_controller'

module NewsBalloonApplicationControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods) # obj.method

    base.class_eval do
      alias_method_chain :user_setup, :last_before_access

      after_filter :store_last_access_on
    end
  end

  module InstanceMethods # obj.method
    # 前回のアクセス日時をユーザに持たせておく
    def user_setup_with_last_before_access
      user_setup_without_last_before_access

      if User.current.logged?
        if User.current.pref[:last_access_on].present?
          User.current.last_before_access_on = User.current.pref[:last_access_on]
        end
        User.current.pref[:last_access_on] = DateTime.now
        # saveは後で行う
      end
    end

    # ユーザ取得時に書き換えたpref[:last_access_on]を保存する
    def store_last_access_on
      # リダイレクト時には更新しないでおく
      if User.current.logged? && User.current.pref.others_changed? && @performed_render && !@performed_redirect
        User.current.pref.save
      end
    end
  end
end

ApplicationController.send(:include, NewsBalloonApplicationControllerPatch)
