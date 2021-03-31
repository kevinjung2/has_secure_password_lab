class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation]
      user = User.create(user_params)
      session[:user_id] = user.id
    else
      redirect_to '/users/new'
    end

  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
