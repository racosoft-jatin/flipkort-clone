class CataloguesController < ApplicationController
  def search
    query = params[:query] 
    if query.present? && query.length < 3
      render json: { error: 'Query must be at least 3 characters long'},
       status: :unprocessable_entity
    else
    render json: search_catalogues.results, only: [:id, :name, :description, :category]
    end
  end


  private
  

  def search_catalogues 
    query = params[:query]
    Catalogue.search(query)
  end
end
