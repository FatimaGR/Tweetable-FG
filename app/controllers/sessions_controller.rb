class SessionsController < ApplicationController
  # GET /login
  def new
  end

  # POST /session
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:message] = "Incorrect credentials"
      render "new", status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
