class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unrpocessable_entity

    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render text: "User successfully destroyed"
    else
      render json: user.errors.full_messages, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user.artworks.concat(user.shared_artworks)

    # if user
    #   render json: user
    # else
    #   render json: user.errors.full_messages, status: :bad_request
    # end
  end

  def update
    user = User.update(params[:id], params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :bad_request
    end
  end



  private



end
