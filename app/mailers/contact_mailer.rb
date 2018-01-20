class ContactMailer < ApplicationMailer
  # メールを送信する
  def send_email(user)
    @user = user
    mail to: @user.email,
          subject: "登録完了しました"
  end
end
