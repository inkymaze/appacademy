class ArtworksController < ApplicationController
  def index
    #render json: params
    user = User.find(params[:user_id])
    @artwork = [user.artworks]
    @artwork << user.shared_artworks
    render json: @artwork
  end

  def create
    artwork = Artwork.new(params.require(:artwork).permit(:name, :email))
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unrpocessable_entity

    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      render text: "artwork successfully destroyed"
    else
      render json: artwork.errors.full_messages, status: :bad_request
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :bad_request
    end
  end

  def update
    artwork = Artwork.update(params[:id], params.require(:artwork).permit(:name, :email))
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :bad_request
    end
  end
end
