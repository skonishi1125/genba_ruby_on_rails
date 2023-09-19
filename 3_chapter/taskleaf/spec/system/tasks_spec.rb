require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザーAを作成しておく
      # 作成者がユーザーAのタスクを用意しておく
    end

    context 'ユーザーAがログインしているとき' do
      before do
        # ユーザーAでログインする(ログインの処理を書いておく)
      end
      
      it 'ユーザーAが作成したタスクが表示される' do
        # 作成済みタスクの名称が画面上に表示されていることを確認する
      end
    end
  end
end