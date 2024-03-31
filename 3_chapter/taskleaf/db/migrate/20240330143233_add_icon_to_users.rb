class AddIconToUsers < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :icon, :string, :default 'default.png', after: :email, comment: 'ユーザーアイコンのパス'
    add_column :users, :icon, :string, after: :email, comment: 'ユーザーアイコンのパス'
  end
end
