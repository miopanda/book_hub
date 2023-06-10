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
  
    if @request.request_type_id.blank? || @request.message.blank?
      flash.now[:error] = "お問い合わせ内容を入力してください。"
      @user = current_user
      render :new
    elsif @request.save
      redirect_to requests_path
    else
      flash.now[:error] = "リクエストの保存に失敗しました。"
      @user = current_user
      respond_to do |format|
        format.html { render :new }
        format.js { render 'error' }
      end
    end
  end
  

  private

  def request_params
    params.require(:request).permit(:request_type_id, :message, :resolved)
  end
end