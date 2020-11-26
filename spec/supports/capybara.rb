# System Specの実行時に「Headless Chrome」が利用されるようになり、テスト実行時にブラウザが立ち上がらない
# + require 'supports/capybara'　in spec_helper
RSpec.configure do |config|
  config.before(:each, type: :system) do
    # window 表示
    driven_by :selenium_chrome
    # 非表示
    # driven_by :selenium_chrome_headless
  end
end
