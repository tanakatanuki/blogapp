module SessionsHelper
  # ログインしていないなら、Userテーブルからユーザー情報を引っ張ってくる
  def current_user
    @current_user || (@current_user = User.find_by(id: session[:user_id]))
  end
  
  # ログイン状態ならtrue、ログインしていないならfalse
  def logged_in?
    !current_user.nil?
  end
end
