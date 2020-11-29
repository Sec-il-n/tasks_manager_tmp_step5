class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  def new
    @task = Task.new
  end
  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to task_path(@task.id),notice: %(タスクを登録しました。)
    else
      flash.now[:danger] = %(タスクの登録に失敗しました。)
      render :new
    end
  end
  def index
    @tasks = Task.order(created_at: :DESC)
  end
  def show

  end
  def edit

  end
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: %(タスクを編集しました。)
    else
      flash.now[:danger] = %(タスクの編集に失敗しました。)
      render :edit
    end
  end
  def destroy
    if @task.delete
      redirect_to tasks_path, notice: %(タスクを削除しました。)
    else
      flash.now[:danger] = %(タスクの削除に失敗しました。)
      render :index
    end
  end
  private
  def set_task
    @task = Task.find_by(id: params[:id])
  end
  def task_params
    params.require(:task).permit(:task_name, :details)
  end
end
