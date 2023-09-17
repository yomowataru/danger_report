class ApplicationController < ActionController::Base

  # 管理者ログインしていない場合、adminを含むURL(管理者ページ)にアクセスできないようにする
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

end
