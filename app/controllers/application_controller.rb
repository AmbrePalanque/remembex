class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    user = User.find_by(id: session[:user_id])
    if user
      @current_user ||= user if session[:user_id]
    else
      session.delete :user_id
    end

    @current_user
  end

  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

end
