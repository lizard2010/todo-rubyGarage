class UsersController < ApplicationController
  before_action  only: [:create]

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to root_url
  end
  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save!
#        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @user, status: :created }
      else
#        format.html { render :new }
#        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.json {   render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :passwd, :provider, :uid)
  end

end