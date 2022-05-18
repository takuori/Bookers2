class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def edit
  end

  def show
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
