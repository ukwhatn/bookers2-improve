class SearchesController < ApplicationController
  before_action :authenticate_user!

  def tag_search
    @tag = Tag.find(params[:id])
    @results = @tag.books

    @book = Book.new
    render :result
  end
end
