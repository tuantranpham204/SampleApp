
class SessionsController < ApplicationController
  def new
    render "sessions/new", status: :unprocessable_entity
  end


  def create
    begin
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        if user.activated?
          forwarding_url = session[:forwarding_url]
          reset_session
          params[:session][:remember_me] == "1" ? remember(user) : forget(user)
          log_in user
          redirect_to forwarding_url || user
        else
          message  = "Account not activated. "
          message += "Check your email for the activation link."
          flash[:warning] = message
          redirect_to root_url
        end
      else
        flash.now[:danger] = "Invalid email/password combination"
        render "sessions/new", status: :unprocessable_entity
      end
    rescue => e
      puts "An exception occurred: #{e.message}"
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
