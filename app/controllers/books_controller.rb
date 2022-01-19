class BooksController < ApplicationController
  def new

    @book = Book.new

  end


# 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end



  def index
    @books = Book.page(params[:page])
    @user = current_user
    @book = Book.new
  end

  def show

    @book = Book.find(params[:id])
    @user = User.find(params[:id])

  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to '/books'
  end



   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end



end
