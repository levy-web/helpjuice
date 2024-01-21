class SearchController < ApplicationController
    def index
        @results = search_for_products
    
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream:
                turbo_stream.update('products',
                                    partial: 'products/products',
                                    locals: { products: @results })
          end
        end
    end

    def suggestions
        @results = search_for_products
    
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream:
                turbo_stream.update('suggestions',
                                    partial: 'search/suggestions',
                                    locals: { results: @results })
          end
        end
    end
    
    private
    
    def search_for_products
        if params[:query].blank?
          Product.all
        else
          Product.search(params[:query], fields: %i[name description], operator: 'or', match: :text_middle)
        end
    end
end
