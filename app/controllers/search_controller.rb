require 'open-uri'

class SearchController < ApplicationController
  def index
    @terms = params[:q]
    if @terms.present?
      client = CombinedSearch.new(params.except(:action, :controller))
      @results = client.search
      @error = client.error
    end

    if request.xhr?
      render :more, layout: false
    else
      render :index
    end
  end

  def autocomplete
    client = CombinedSearch.new(params.except(:action, :controller))
    render json: client.completion
  end
end
