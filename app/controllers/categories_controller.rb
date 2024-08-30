class CategoriesController < ApplicationController
  def search
    query = params[:query]
    if query.present? && query.length < 4
      render json: { error: 'Query must be at least 4 characters long'},
       status: :unprocessable_entity
    else
    render json: search_categories.results, only: [:id, :name]
    end
  end


  private


  def search_categories
    query = params[:query]
    Category.search(query)
  end
end
