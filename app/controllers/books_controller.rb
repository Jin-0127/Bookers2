class BooksController < ApplicationController
  def new
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id =current.user_id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
    @user =User.first
  end

  def show
  end
  
  private

  def book_params
    params.requeire(:book).permit(:title,:body,:image)
  end

end
