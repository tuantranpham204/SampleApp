class SessionsController < ApplicationController
  def new
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end


  def create
    render 'new', status: :unprocessable_entity
  end
  def destroy
  end
end
