class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @books = Book.all
   if @book.save
     redirect_to book_path(@book.id)
   else
     render :index
   end
   flash.now[:notice] ="You have created book successfully."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
    flash.now[:notice] = "You have updated book successfully."
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
