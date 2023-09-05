class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		user = User.create!(user_params)
		render json: user
	end

	def show
		user = User.last
		render json: url_for(user.avatar)
	end

	def destroy
		user = User.last
		user.avatar.purge_later
		render json: user
	end

	def download
		user = User.first
		binary = user.avatar.download
    render json: binary
  end

	private
  def user_params
    params.permit(:avatar)
  end
end
