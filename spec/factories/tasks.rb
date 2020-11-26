FactoryBot.define do
  factory :task do
    task_name { 'タスク' }
    # sequence(:task_name){ |n| "タスク#{n}" }
    details { 'テスト_詳細' }
  end
  # 存在しない ↓クラス名の名前をつける場合
  factory :task_2, class: Task do
    task_name { 'タスク2' }
    details { 'テスト_詳細2' }
  end
end
