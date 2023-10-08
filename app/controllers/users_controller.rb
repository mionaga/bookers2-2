class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    else
      redirect_to user_path(@user.id)
    end
  end

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
