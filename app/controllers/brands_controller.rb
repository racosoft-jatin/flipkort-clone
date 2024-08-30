class BrandsController < ApplicationController
  def search
    query = params[:query]
    if query.present? && query.length < 3
      render json: { error: 'Query must be at least 3 characters long'},
       status: :unprocessable_entity
    else
    render json: search_brands.results, only: [:id, :name]
    end
  end

  private

  def search_brands
    query = params[:query]
    Brand.search(query)
  end
end
