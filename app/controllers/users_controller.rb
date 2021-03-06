class UsersController < ApplicationController
  before_action :set_user
  skip_before_action :authenticate_user
  def new
    @user = User.new
    if logged_in?
      redirect_to tasks_path, notice: t('dictionary.words.cannot create user')
    # else
    #   @user = User.new
    end
  end
  def create
    # binding.pry
    @user = User.new(user_params)
    # @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      # 出ない
      redirect_to user_path(@user.id), notice: t('dictionary.words.user created')
    else
      # flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end
  def show
    # binding.pry
    if current_user.id != params[:id].to_i
      redirect_to tasks_path, notice: t('dictionary.words.cannot see other details')
    end
  end
  def edit

  end
  def update
    # ？？要件なし
    if @user.update(user_params)
      redirect_to(tasks_path, notice: t('tasks.index.editted'))
      # redirect_to(tasks_path, notice: 'ユーザー情報を編集しました。')
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
  def set_user
    @user = User.find_by(id: params[:id])
  end
end
