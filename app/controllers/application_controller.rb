class ApplicationController < ActionController::Base
  helper_method %i[current_user logged_in?]

  def current_user
    @current_user = @current_user || User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete :user_id
  end
end
