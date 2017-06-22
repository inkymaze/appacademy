class UsersController < ApplicationController

  def new
    @current_user = User.new
    render :new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      login_user!
      redirect_to cats_url
    else
      redirect_to new_user_url
    end
  end




  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
