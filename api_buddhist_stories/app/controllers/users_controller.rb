class UsersController < ApplicationController

	def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: { token: user.token }
      #redirect_to '/'
    else
      message = user.errors || ''
      render json: { errorCode: "Create User", errorDescription: message}
      #redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end