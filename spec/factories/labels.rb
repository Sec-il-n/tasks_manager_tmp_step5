FactoryBot.define do
  sequence :label_names do |n|
    "label_#{n}"
  end
# 元 異名使えない。
  # factory :label_origin do
  #   label_name { generate :label_names }
  #
  # end
  factory :label do
    label_name { generate :label_names }
    # after(:create) do |label|
    #   task = create(:task_7)
    #   create(:manager, label: label, task: task )
    # end
    
    # belongs_to & foreigin_key
    # association :user　←taskでも呼び出されているのでそれを使用
    # { アソシエーション名.同 }
    # undefined method　←先に要manager?
    # user { task.user }
    user { task.user }
    # ここで呼び出されて作成されるイメージ

  end
  factory :label_own do
    label_name { 'label_own' }
  end
end
