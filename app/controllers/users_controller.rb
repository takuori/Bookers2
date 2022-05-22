class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    flash.now[:notice] = "Welcome! You have signed up successfully."
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
    flash.now[:notice] = "You have updated user successfully."
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :self_introduction)
  end
end
