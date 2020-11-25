class Task < ApplicationRecord
  validates :task_name, presence: true, length:{ maximum:60 }
  validates :details, length:{ maximum:255 }
  # validates :valid
  # validates :priority
  # validates :status
end
