20.times do |n|
  task_name = Faker::Name.name
  details = 'テスト_詳細'
  # created_at = Faker::Time.between_dates(from: Date.today - 10, to: Date.today, period: :all)
  valid_date = Faker::Time.between_dates(from: Date.today, to: Date.today + 20)
  status = ["未着手", "着手中", "完了"].sample
  Task.create!(
    task_name: task_name,
    details: details,
    # created_at = created_at,
    valid_date: valid_date,
    status: status,
  )
end
