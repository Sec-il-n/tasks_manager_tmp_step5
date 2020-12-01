class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  def new
    @task = Task.new
  end
  def create
    @task = Task.create(task_params)
    # today = Date.current
    # if @task.valid_date >= today
    # # if valid_date?
    #   redirect_to tasks_path
    # else
    #   render :new
    # end
    if @task.save
      redirect_to task_path(@task.id),notice: %(タスクを登録しました。)
    else
      flash.now[:danger] = %(タスクの登録に失敗しました。)
      render :new
    end
    # end
  end
  def index
    @tasks = Task.order(created_at: :DESC)
    if params[:order_valid].present?
      # ✖︎　Task.sort_by{ |task| task.valid_date }
      @tasks = @tasks.sort_by{ |task| task.valid_date }
    end

    if params[:status] && params[:task_name]
      @tasks = @tasks.where(status: params[:status])
      .where('task_name LIKE?',"%#{params[:task_name]}%")

    elsif params[:task_name]
      # binding.pry
      @tasks = Task.where('task_name LIKE?',"%#{params[:task_name]}%")
    elsif params[:status]
      # binding.pry
      @tasks = Task.where(status: params[:status])
    # else
    #   @tasks = Task.order(created_at: :DESC)
    end
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
    params.require(:task).permit(:task_name, :details, :valid_date, :status)
  end
  # def search_params
  #   params.fetch(:search).permit()
  # end
end
