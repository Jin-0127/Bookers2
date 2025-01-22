class BooksController < ApplicationController
  def new
    @new_book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice]
    redirect_to book_path(@book)
  else
    render :new
    end
  end

  def index
    @books = Book.all
    @user =User.first
    @new_book =Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user =User.first
  end

  def edit
    @book = Book.find(params[:id])
    @user =User.first
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(@book)
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
