FactoryBot.define do
  factory :user do
    user_name { "MyString" }
    email { "MyString@hoge.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
  factory :user_2, class: User do
    user_name { "MyString" }
    email { "MyString2@hoge.com" }
    password { "MyString" }
    password_confirmation { "MyString" }

    after(:create) do |user|
      create_list(:label, 3, user: user, label: create(:label))
      # create_list(:label, 3, user: user)
      # 1: 作成するインスタンス名　2: 個数　３：値
    end
  end
end
