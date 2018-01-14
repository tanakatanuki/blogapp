class Bblog < ApplicationRecord
    validates :name, presence: true
    validates :content, presence: true, length: {in: 1..140}
    
    # 1:多モデルの定義
    has_many :favorites, dependent: :destroy
    # favorite_usersという名のメソッドで、usersテーブルにアクセス
    has_many :favorite_users, through: :favorites, source: :user
end
