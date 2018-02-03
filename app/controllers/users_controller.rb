class UsersController < ApplicationController
  before_action :correct_user, only:[:create, :show]
  
  def new
    @user = User.new
  end
  
  # 入力ユーザー情報がDBに保存されたとき、メール送信する
  def create
    @user = User.new(user_params)
    # キャッシュから画像を復元 ← 確認画面を挟まないので不要
    # @user.image.retrieve_from_cache! params[:cache][:image]
    if @user.save
      ContactMailer.send_email(@user).deliver
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
    @favorite_bblogs = @user.favorite_bblogs
  end
  
  private
  
  # 別ユーザーのページに、直URLでアクセスできないようにする
  # find_byを使ったのは、例外を発生させるため
  def correct_user
    # user = User.find(params[:id])
    user = User.find_by(id: params[:id])
    if user != current_user
      redirect_to new_session_path
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email,
                                :password,
                                :password_confirmation,
                                :image)
  end
end
