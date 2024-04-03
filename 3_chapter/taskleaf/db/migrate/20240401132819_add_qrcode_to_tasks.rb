class AddQrcodeToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :qrcode, :string, after: :description, comment: 'task_path のURLへ繋がるQRコードのファイル名'
  end
end
