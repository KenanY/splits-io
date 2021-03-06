class Api::V3::UsersController < Api::V3::ApplicationController
  before_action :set_user, only: [:show]

  def show
    render json: @user, serializer: Api::V3::UserSerializer
  end

  private

  def set_user
    @user = User.find_by(name: params[:id]) || User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render status: 404, json: {status: 404, message: "User with name or id '#{params[:id]}' not found."}
  end
end
