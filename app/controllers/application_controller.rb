class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # 全コントローラーで使えるよう、sessinosmoduleをインクルード
  include SessionsHelper
  
  # フラッシュメッセージにnotice,alert以外のキーを許可する
  add_flash_types :success, :info, :warning, :danger
end
