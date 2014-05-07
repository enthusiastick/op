class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Signed up."
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Whups, something went wrong."
      render :new
    end
  end

  def new
    @user = Omniauther.authenticate(env['omniauth.auth'])
    if @user.valid?
      flash[:success] = "Signed in."
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      if env['omniauth.auth']['provider'] == 'google_oauth2'
        @user.provider = 'google_oauth2'
      elsif env['omniauth.auth']['provider'] == 'facebook'
        @user.provider = 'facebook'
      end
      if @user.provider != nil
        @user.name = env['omniauth.auth']['info']['name']
        @user.email = env['omniauth.auth']['info']['email']
        @user.omniauth_id = env['omniauth.auth']['uid']
      end
    end
  end

  def signout
    session[:current_user_id] = nil
    flash[:success] = "Signed out."
    redirect_to root_path
  end

  protected

  def user_params
    params.require(:user).permit(:handle, :name, :email, :provider, :omniauth_id)
  end

end
