require 'pry'

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if !session_params[:name] || session_params[:name] == ""
      redirect_to "/login"
    else
      @user = User.find_by(name: session_params[:name])
      return head(:forbidden) unless @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    end
  end

  def destroy

  end
  private
    def session_params
      params.require(:user).permit(:name, :password)
    end
end
