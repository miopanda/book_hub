class LoansController < ApplicationController
  before_action :set_book_and_loan, only: [:edit, :update]

  def new
    @book = Book.find(params[:book_id])
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.valid?
      @loan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
   
  end

  def update
    if @loan.update(loan_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def loan_params
    @book = Book.find(params[:book_id])
    params.require(:loan).permit(:due_date, :returned).merge(user_id: current_user.id, book_id: @book.id)
  end

  def set_book_and_loan
    @book = Book.find(params[:book_id])
    @loan = Loan.find(params[:id])
  end

end
