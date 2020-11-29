class Task < ApplicationRecord
  with_options presence: true do
    validates :task_name, length:{ maximum:60 }
    validates :details, length:{ maximum:255 }
    validates :valid_date
  end
  validate :not_before_today
  # validates :priority
  # validates :status
  def not_before_today
    errors.add(:valid_date, 'は今日以降の日付を選択してください。') if valid_date.nil? || valid_date < Date.current
  end
end
