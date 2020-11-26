require 'rails_helper'
# RspecのVer3.7まではFeature Spec
RSpec.describe Task, type: :system do
# ✖︎　RSpec.describe Task, type: :model do　SystemSpecなので
  describe 'タスク管理機能' do
    context 'タスクを新規作成したとき' do
      it '作成したタスクが画面に表示される' do
    # 1. new_task_pathに遷移する
        visit new_task_path
        # Capybaraの標準APIにはリロード用のメソッドが無いので、「現在のパスに再度移動する」という操作でリロードをシミュレート
        visit current_path
    # 2. 新規登録内容を入力する
    #          ラベルの表示↓日本語化したら要変更
        fill_in 'Task name', with: 'task_name'
        fill_in 'Details', with: 'task_details'
    # 3. 「登録する」ボタンをクリックする
        # click_on '登録する'#button link両方可能
        click_button '登録する'
    # 4. clickで登録した情報が、タスク詳細ページに表示されているかを確認
        expect(page).to have_content('task_name')
        expect(page).to have_content('task_details')
    end
  end
  describe '一覧表示機能'
   context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # タスクの作成(単発でtasks.rbの':task'で定義されているテストデータのtask_name属性を上書きして作成。)
        task = FactoryBot.create(:task, task_name: 'task上書き')
        # task = FactoryBot.create(:task, task_name: 'task')
        # capybaraでページ遷移の実装
        visit tasks_path #()なし注意
        expect(page).to have_content('task上書き')
        # expect(page).to have_content('task')
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         task = FactoryBot.create(:task_2, details: '詳細上書き')
         # capybaraでページ遷移の実装
         visit task_path(task.id)
         expect(page).to have_content('詳細上書き')
       end
     end
  end
end
