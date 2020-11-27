class ChangeColumnAddNotnullDetailsOnTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :details, false
  end
end
