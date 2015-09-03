class SearchController < ApplicationController
  def index
    @result = Search.new(search_params[:keyword])

    if @result.exact

      redirect_to @result.exact

    else
      @results = @result.fuzzy

      flash[:notice] = "No results matching that query." if @results.empty?

      render 'index'
    end
  end

  private

  def search_params
    params.require('search').permit('keyword')
  end
end
