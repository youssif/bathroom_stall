class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    @auth = request.env["omniauth.auth"]
<<<<<<< HEAD
    # render 'index'
=======
>>>>>>> cf0e3a79fa0eda97999d5169735c623ad00a0cdf
    user = User.where(:provider => @auth['provider'], 
                      :uid => @auth['uid'].to_s).first || User.create_with_omniauth(@auth)
# Reset the session after successful login, per
# 2.8 Session Fixation – Countermeasures:
# http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    reset_session
    session[:user_id] = user.id
    if user.email.blank?
      redirect_to edit_user_path(user), :alert => "Please enter your email address."
    else
      redirect_to root_url, :notice => 'Signed in!'
    end

  end

  def index
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

  def index
    
  end

end
