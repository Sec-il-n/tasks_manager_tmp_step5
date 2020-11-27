FactoryBot.define do
  factory :task do
    task_name { 'タスク' }
    details { 'テスト_詳細' }
  end
  factory :task_2, class: Task do
    task_name { 'タスク2' }
    details { 'テスト_詳細2' }
  end
  sequence :task_name_sequence do |n|
    "タスク#{n}"
  end
  factory :task_3, class: Task do
    task_name { generate :task_name_sequence }
    details { 'テスト_詳細3' }
    created_at { Time.current }
  end
end
