class Favorite < ApplicationRecord
  # 中間テーブル
  belongs_to :user
  belongs_to :bblog
end
