require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '入力項目バリデーション' do
    context 'タスクのタイトルが空のとき' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.create(:task_2, task_name: '', details: 'タスク名空 バリデーション')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空のとき' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.create(:task_2, details:'')
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されているとき' do
      it 'バリデーションに通る' do
        task = FactoryBot.create(:task)
        expect(task).to be_valid
      end
    end
  end
end
