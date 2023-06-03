class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]

  def index
    # @books = Book.includes(:user).order("created_at ASC")
    @books = Book.paginate(page: params[:page], per_page: 6)
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

  def search
    @books = Book.search(params[:keyword])
    flash[:notice] = "検索完了" if params[:keyword].present?
  end
  
  def about
    
  end

  private

  def book_params
    params.require(:book).permit(:title, :publisher, :image_url).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
