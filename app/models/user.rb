class User < ApplicationRecord
  validates :name, presence: true,
                  length: {maximum: 30}
  validates :email, presence: true,
                  length: {maximum: 255},
                  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  # DBに保存前に、emailを小文字にする
  before_save {email.downcase!}
  
  # パスワードをハッシュ化するため、has_secure_passwordメソッドを使う
  has_secure_password
  validates :password, presence: true,
                    length: {minimum: 6}
end
