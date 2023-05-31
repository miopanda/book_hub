class RequestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @requests = Request.includes(:user).where(user_id: current_user.id).order("created_at DESC")
  end

  def new
    @request = Request.new
    @user = current_user
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:request_type_id, :message, :resolved)
  end
end
