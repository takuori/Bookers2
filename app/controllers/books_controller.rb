class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @books = Book.all
   if @book.save
     flash.now[:success] ="You have created book successfully."
     redirect_to book_path(@book.id)
   else
     render :index
   end
  end

  def edit
    @book = Book.find(params[:id])
    if @user == current_user
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash.now[:notice] = "You have updated book successfully."
    else
      render :edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
