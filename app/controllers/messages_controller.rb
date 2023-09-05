class MessagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
    message = Message.create!(message_params)
    render json: message
  end

  def show
  	message = Message.last
  	images = message.images.map{ |image| url_for(image)}
  	render json:  images
  end

  private
  def message_params
    params.permit(images:[])
  end
end