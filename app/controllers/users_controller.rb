class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to tweets_path
    else
      flash[:message] = "Incorrect credentials"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @password = current_user.password
    @user = current_user
  
    if @user.update(user_params)
      redirect_to root_path
    else
      flash[:message] = "Incorrect credentials"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to tweets_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :name, :avatar, :password, :password_confirmation)
  end

end
