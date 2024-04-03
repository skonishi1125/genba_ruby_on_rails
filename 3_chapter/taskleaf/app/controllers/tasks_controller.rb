class TasksController < ApplicationController
  require "rqrcode"
  require "rqrcode_png"
  require "chunky_png"
  # こちらのアクションの前にtaskを取得しておく
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    logger.debug "【LOG】current_user: #{current_user[:id]}, name: #{current_user.name?}"
    logger.debug "【LOG】#{current_user.tasks.to_sql}}"
    @tasks = current_user.tasks.recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    # merge
    ## task_paramsというハッシュにuser_idというキーを追加して新しいハッシュを生成することを意味する
    ## 今回の場合、user_idの値はcurrent_user.idになる
    # except
    ## qrcode_flagというカラムは存在しないのでnewで作るとエラーになるので省くという意味合い
    @task = Task.new(task_params.merge(user_id: current_user.id).except(:qrcode_flag))
    if @task.save
      if params[:task][:qrcode_flag] == "1"
        create_qrcode
      end
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    logger.debug "パラメータ: #{task_params} ぱらむ: #{params}"
    puts "ログテスト"
    @task.update!(task_params.except(:qrcode_flag))
    if params[:task][:qrcode_flag] == "1"
      create_qrcode
    end
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :qrcode_flag, :image)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def create_qrcode
    url = url_for(@task) # @taskオブジェクトに対応するRESTfulなルートを自動で呼ぶ
    qrcode = RQRCode::QRCode.new(url)

    # .pngで保存
    @qr = qrcode.as_png(
      resize_gte_to: false, resize_exactly_to: false, fill: 'white',
      color: 'black', size: 240, border_modules: 4, module_px_size: 6,
      file: nil # ファイルに保存せず、データを直接取得
    )

    # ファイル名はurlをMD5でハッシュ化した値とする
    encripted_file_name = Digest::MD5.hexdigest(url) + '.png'

    # 格納先 存在しない場合は作成する
    folder_path = "#{Rails.public_path}/uploads/task"
    FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)

    # pngで保存し、画像名をカラムに格納する
    IO.binwrite("#{Rails.public_path}/uploads/task/#{encripted_file_name}",@qr)
    @task.update(qrcode: encripted_file_name)
  end

end
