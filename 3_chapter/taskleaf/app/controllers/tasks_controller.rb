class TasksController < ApplicationController
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
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    logger.debug "パラメータ: #{task_params} ぱらむ: #{params}"
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
