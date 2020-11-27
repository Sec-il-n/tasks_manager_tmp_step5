class Task < ApplicationRecord
  with_options presence: true do
    validates :task_name, length:{ maximum:60 }
    validates :details, length:{ maximum:255 }
  end
  # validates :valid
  # validates :priority
  # validates :status
end
