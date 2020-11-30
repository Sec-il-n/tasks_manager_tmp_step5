require 'rails_helper'
RSpec.describe Task, type: :system do
  describe 'タスク管理機能' do
    context 'タスクを新規作成したとき' do
      it '作成したタスクが画面に表示される' do
        visit new_task_path
        visit current_path
        fill_in 'タスク名', with: 'task_name'
        fill_in '詳細', with: 'task_details'
        click_button '登録する'
        expect(page).to have_content('task_name')
        expect(page).to have_content('task_details')
    end
  end
  describe '一覧表示機能'
   context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, task_name: 'task上書き')
        visit tasks_path
        expect(page).to have_content('task上書き')
      end
    end
    context '一覧画面表示されたとき' do
      it '作成日時の降順で表示される' do
        task = FactoryBot.create_list(:task_3, 10)
        visit tasks_path
        task_list = all('#sequence #task_name')
        j = 9
        for i in 0..9
          expect(task_list[i].text).to have_content(task[j].task_name)
          j -= 1
        end

      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         task = FactoryBot.create(:task_2, details: '詳細上書き')
         visit task_path(task.id)
         expect(page).to have_content('詳細上書き')
       end
     end
  end
end
