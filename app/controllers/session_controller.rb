class SessionController < ApplicationController
  def create
    user = User.create(
      name: env['omniauth.auth']['info']['name'],
      uid:  env['omniauth.auth']['uid'],
    )
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
