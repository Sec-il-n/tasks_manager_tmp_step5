require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '入力項目バリデーション' do
    context 'タスクのタイトルが空のとき' do
      it 'バリデーションに引っかかる' do
        # task = Task.new(task_name: '', details: 'タスク名空 バリデーション')
        task = FactoryBot.build(:task_2, task_name: '', details: 'タスク名空 バリデーション')
        task.valid?
        expect(task.errors.full_messages).to include('タスク名を入力してください')
      end
    end
    context 'タスクの詳細が空のとき' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task_2, details:'')
        task.valid?
        expect(task.errors.full_messages).to include('詳細を入力してください')
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
