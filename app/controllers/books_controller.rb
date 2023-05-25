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
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :publisher, :image_url).merge(user_id: current_user.id)
  end
end
