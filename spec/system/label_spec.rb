require 'rails_helper'
describe 'ラベル管理機能'do
  let(:confirmation) { find(:xpath, '/html/body/div/div/div/form/div[3]/input[2]') }
  #  ここでは実体がないので　undefined method `map' for :checkboxes:Symbol　
  # let(:checkboxes) { find(all('/html/body/div/div/div/form/div[7]/input')) }.map.with_index { |checkbox, i| checkbox if i.odd? }
  # InvalidSelectorError:
  # let(:checkboxes) { find(all('/html/body/div/div/div/form/div[7]/input')) }
  let(:checkbox_1) { find('/html/body/div/div/div/form/div[7]/input[1]') }
  let(:checkbox_3) { find('/html/body/div/div/div/form/div[7]/input[3]') }

  context 'タスクの新規作成時'do
    it 'そのタスクに紐づいたラベルを選択し登録できる'do
      tasks = FactoryBot.create(:task_7)
    end
  end
  context 'タスクを編集する際'do
    it 'そのタスクに紐づいたラベルを選択し再登録(更新)できる'do

    end
  end
  context 'タスク新規登録時または編集時'do
    it '管理者の管理するラベル(seed)とログインユーザーが作成したラベルのみ選択できる'do
    # ラベル表示されない
    # login_as_user
    # visit new_label_path
    # fill_in "#{I18n.t('.labels.show.label name')}", with: '自作ラベル'
    # find(:xpath,'/html/body/div/div/div/form/div[2]/input[2]').click
    #
    # visit new_task_path
    # expect(page).to have_content('自作ラベル')
    end
  end
  it 'ログインユーザがラベルを作成ができる' do
    # login_as_user
    # #  undefined local variable or method ？！ tasks_spec_helpper。rbに移しても同じ
    # # create_own_label　
    # visit new_label_path
    # fill_in "#{I18n.t('.labels.show.label name')}", with: '自作ラベル'
    # find(:xpath,'/html/body/div/div/div/form/div[2]/input[2]').click
    #
    # confirmation.click
    # expect(page).to have_content("#{I18n.t('.labels.create.label created')}")
  end
  it'タスクに複数のラベルをつけられる' do
    FactoryBot.create_list(:label, 5)
    login_as_user
    # fill_in_form helpers使えない問題　'タスクを新規作成'でも使いたい
    # 切り出し
    visit new_task_path
    fill_in 'タスク名', with: 'task_name'
    fill_in '詳細', with: 'task_details'
    fill_in '終了期限', with: '002020-12-18'
    find('#task_status').find(:xpath, 'option[3]').select_option
    check('label_2')
    check('label_4')
    check('label_5')
    click_on('登録する')
    expect(page).to have_content('label_2')
    expect(page).to have_content('label_4')
    expect(page).to have_content('label_5')
  end
  context 'タスクの詳細画面に遷移した場合'do
    let(:elements) { all(:xpath, '//*[@id="sequence"]/td[7]/a') }
    # let(:task) { create_list(:task_7, user) }
    it'タスクに紐づいているラベル一覧が出力される'do
      login_as_user
      labels = FactoryBot.create(:label)
      # labels = FactoryBot.create_list(:label, 7)
      # task = FactoryBot.create(:task_7)
      binding.pry
      # 切り出し　「タスクに複数のラベルをつけられる」
      visit new_task_path
      # fill_in 'タスク名', with: 'task_name'
      # fill_in '詳細', with: 'task_details'
      # fill_in '終了期限', with: '002020-12-18'
      # find('#task_status').find(:xpath, 'option[3]').select_option
      # check('label_2')
      # check('label_4')
      # check('label_5')
      # click_on('登録する')


    end
  end
  describe 'ラベル検索機能'do
    context 'ラベルを一つ選択した場合'do
      it 'そのラベルがついているタスクが表示される'do

      end
    end
  end
end
