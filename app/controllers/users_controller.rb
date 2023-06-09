class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @email = @user.email
    @books = @user.books
    @borrowed_books = @user.borrowed_books
  end
end
