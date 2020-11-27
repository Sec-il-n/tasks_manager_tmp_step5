FactoryBot.define do
  factory :task do
    task_name { 'タスク' }
    details { 'テスト_詳細' }
  end
  factory :task_2, class: Task do
    task_name { 'タスク2' }
    details { 'テスト_詳細2' }
  end
end
