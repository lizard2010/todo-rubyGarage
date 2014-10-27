class UsersController < ApplicationController
  before_action  only: [:create, :login, :projects, :tasks]

  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to root_url

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

  # POST /users/login.json
  def login
    @user = User.where(login_params).first;
    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        format.json { render json: @user }
      else
        format.html {}
        format.json { render json: { status: :not_found} }
      end
    end
  end

  # GET /users/tasks/:pid
  def tasks
    if session[:user_id]
      @user = User.find(session[:user_id]);
      render json: @user.projects.find(params[:pid]).tasks.order(:prio, created_at: :desc)
    end
  end
  # GET /users/projects.json
  def projects
    if session[:user_id]
      @user = User.find(session[:user_id]);
      render json: @user.projects
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :passwd, :provider, :uid)
  end
  def login_params
    params.require(:user).permit(:email, :passwd)
  end

end