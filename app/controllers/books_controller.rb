class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user

    if @book.save
      redirect_to book_path(@book), notice: "You have create book successfuly."
    else
      @books = Book.all
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = current_user
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @user = current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @books = Book.all
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
