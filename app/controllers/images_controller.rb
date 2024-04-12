class ImagesController < ApplicationController
  def show
    image = Image.find(params[:id])
    send_data image.picture.download, type: image.picture.content_type, disposition: 'inline'
  end

  def create
    image = Image.new(image_params)
    if image.save
      render json: { link: image_url(image) }
    else
      render json: { errors: image.errors }, status: :unprocessable_entity
    end
  end

  private

  def current_domain
    request.protocol + request.host_with_port
  end

  def image_params
    params.permit(:title, :description, :picture)
  end
end
