
class SessionsController < ApplicationController
  def new
    render 'sessions/new', status: :unprocessable_entity
  end


  def create
    begin
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        reset_session
        log_in(user)
        redirect_to current_user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'sessions/new', status: :unprocessable_entity
      end
    rescue => e
      puts "An exception occurred: #{e.message}"
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
