require 'rails_helper'
# 要リファクタリング　？
# RSpec.describe Task, type: :model do　⤵︎カリキュラム
describe 'タスクモデル機能', type: :model do
  describe '入力項目バリデーション' do
    context 'タスクのタイトルが空のとき' do
      it 'バリデーションに引っかかる'
    end
    context 'タスクの詳細が空のとき' do
      it 'バリデーションに引っかかる'
    end
    context 'タスクのタイトルと詳細に内容が記載されているとき' do
      it 'バリデーションに通る'
    end
  end

end
