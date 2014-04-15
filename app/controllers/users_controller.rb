class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Signed up."
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
      redirect_to root_path
    else
      if env['omniauth.auth']['provider'] == 'google_oauth2'
        @user.provider = 'google_oauth2'
        @user.name = env['omniauth.auth']['info']['name']
        @user.email = env['omniauth.auth']['info']['email']
        @user.omniauth_id = env['omniauth.auth']['uid']
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(:handle, :name, :email, :provider, :omniauth_id)
  end

end
