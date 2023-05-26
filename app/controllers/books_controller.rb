class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @books = Book.includes(:user).order("created_at ASC")
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
      flash[:notice] = "本が登録されました"
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    if user_signed_in?
      @loan = Loan.find_by(book_id: @book.id, user_id: current_user.id)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :publisher, :image_url).merge(user_id: current_user.id)
  end
end
