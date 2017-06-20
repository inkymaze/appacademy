class ArtworkSharesController < ApplicationController

  def index
    artwork_shares = ArtworkShare.all
    render json: artwork_shares
  end

  def create
    share = ArtworkShare.new(params.require(:share).permit(:user_id, :art_id))
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity

    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])
    if share.destroy
      render json: share
    else
      render json: share.errors.full_messages, status: :bad_request
    end
  end

end
