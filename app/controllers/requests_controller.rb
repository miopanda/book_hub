class RequestsController < ApplicationController
  def index
    @requests = Request.order("created_at DESC")
  end

  def new
    @request = Request.new
    @user = current_user
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:request_type_id, :message, :resolved).merge(user_id: current_user.id)
  end
end