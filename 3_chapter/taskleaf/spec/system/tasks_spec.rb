require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザーAを作成しておく
      user_a = FactoryBot.create(:user, name:'ユーザーA', email: 'a@example.com')
      # 作成者がユーザーAのタスクを用意しておく
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        # ユーザーAでログインする(ログインの処理を書いておく)
          # ログイン画面への遷移
          visit login_path
          # メールアドレス、パスワードの入力
          fill_in 'メールアドレス', with: 'a@example.com'
          fill_in 'パスワード', with: 'password'
          # submitボタンの押下
          click_button 'ログインする'
      end
      
      it 'ユーザーAが作成したタスクが表示される' do
        # 作成済みタスクの名称が画面上に表示されていることを確認する
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end