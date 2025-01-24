class BooksController < ApplicationController

  
  def new
    @new_book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice]="You have created book successfully."
    redirect_to book_path(@book)
  else
    @user = current_user
    @books = Book.all
    @new_book =Book.new
    flash.now[:notice] = "error"
    render 'index'
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @new_book =Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])

    unless @book.user_id ==current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book)
    else
      flash.now[notice]="error"
      render 'edit'
    end
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
