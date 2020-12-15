class Label < ApplicationRecord
  #  一般ユーザが作成　presence: true
  validates :label_name, presence: true, length: { maximum: 20 }
  # presence: true　バリデーションメッセージが「User入力」になる　-> optional: true
  belongs_to :user, optional: true
  has_many :managers, dependent: :destroy, foreign_key: 'label_id'# 外部キーオプションは「キーが存在しない（中間ではない）テーブルのモデル」に付与
  # managers のlabel＿id（:label）を使ってタスクを取得
  has_many :tasks, through: :managers, source: :label
  # has_many :tasks, through: :managers
  #label検索のアソシエーション？　　飯田メンター　
  # has_many :potaskssts, through: :manager, source: :label
end
# db notnull 未設定
