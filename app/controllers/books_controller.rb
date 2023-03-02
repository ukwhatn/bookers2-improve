class BooksController < ApplicationController
  def create
    @new_book = Book.new(post_params)
    @new_book.user_id = current_user.id
    
    if @new_book.save
      flash[:notice] = "New entry is successfully created."
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
    @books = Book.all
    @new_book = Book.new()
  end
  
  def show
    @book = Book.find(params[:id])
    @new_book = Book.new()
  end
  
  def edit
    @book = Book.find(params[:id])
    
    if @book.user != current_user
      redirect_to books_path
      return
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    
    if @book.user != current_user
      redirect_to book_path(@book.id)
      return
    end
    
    if @book.destroy
      redirect_to books_path
    else
      render :edit
    end
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.user != current_user
      redirect_to book_path(@book.id)
      return
    end
    
    if @book.update(post_params)
      flash[:notice] = "The book information is successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private
  def post_params
    params.require(:book).permit(:title, :body)
  end
end
