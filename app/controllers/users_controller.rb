class UsersController < ApplicationController
  def show
    @user = User(params[:id])
    @books = @user.books
  end

  def edit
  end
end
