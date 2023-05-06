class SearchesController < ApplicationController
  def search
    @q = Book.ransack(search_params)
    @books = @q.result.includes(:user)
  end

  private
  def search_params
    params.require(:q).permit(:title_cont)
  end
end
