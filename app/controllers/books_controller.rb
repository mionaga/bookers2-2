class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end  
  
  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to request.referer
  end  
  
private

  def book_params
    params.require(:book).permit(:title, :body)
  end  
  
  
end
