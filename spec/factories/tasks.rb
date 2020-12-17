FactoryBot.define do
  factory :task do
    task_name { 'タスク' }
    details { 'テスト_詳細' }
  end
  # factory :task_2, class: Task do
  #   task_name { 'タスク2' }
  #   details { 'テスト_詳細2' }
  # end
  sequence :task_name_sequence do |n|
    "タスク#{n}"
  end
  sequence :task_valid_sequence do |n|
    n = rand(10) * n
    Time.current.since(n.days)
    # Time.current.since(n.days)
  end
  factory :task_3, class: Task do
    task_name { generate :task_name_sequence }
    details { 'テスト_詳細3' }
    created_at { Time.current }#
    status { "#{["未着手", "着手中", "完了"].sample}" }
    valid_date { generate :task_valid_sequence }
    # 追記
    priority { "#{['高', '中', '低'].sample}" }
    # priority { "#{[1, 2, 3].sample}" }
  end
  # factory :task_4, class: Task do
  #   task_name { generate :task_name_sequence }
  #   details { 'テスト_詳細3' }
  #   created_at { "#{5.days.ago}" }
  #   valid_date { "#{Time.current.since(10.days)}"  }
  #   # valid_date { Time.current += 10 }
  # end
  factory :task_5, class: Task do
    # task_name = [*'a'..'z'].shuffle[0..9]
    # task_name = ('a'..'z').to_a.shuffle[0..9]
    # task_name { "#{task_name}" }
    task_name { 'タスク' }
    details { 'テスト_詳細' }
    status { "#{["未着手", "着手中", "完了"].sample}" }
    valid_date { '002020-12-18'  }
  end
  # factory :task_6, class: Task do
  #   task_name { 'タスク234' }
  #   details { 'テスト_詳細' }
  #   status { "#{I18n.t('.dictionary.words.Not started')}" }
  #   valid_date { '002020-12-18'  }
  # end
  # 現在使用中  3,5 テスト書き直しと、↓使用できるかを確認
  factory :task_7, class: Task do
    task_name { generate :task_name_sequence }
    details { 'テスト_詳細3' }
    created_at { "#{5.days.ago}" }
    valid_date { "#{Time.current.since(10.days)}"  }
    status { "#{["未着手", "着手中", "完了"].sample}" }
    priority { "#{['高', '中', '低'].sample}" }
    # association :user
    association :user, factory: :user_2
    # 中間テーブル作成
    after(:create) do |task|
      # labels = create_list(:label, 3) Spec側で⤵︎　？
      # let(:labels) { create_list(:label, 3) }
      create_list(:managers, 3, tasks: [task], labels: [label])
      # create_list(:manager, 3, tasks: [task], label: label)
      # 1: 作成するインスタンス名　(2: 個数)　3： アソシエーション? (複数形)：値 ([値=_ids[]]) , ...
    end
  end
end
