class SearchController < ApplicationController
  before_action :search_client

  def index
    @terms = params[:q]
    if @terms.present?
      @results = @client.search
      @error = @client.error
    end

    if request.xhr?
      render :more, layout: false
    else
      render :index
    end
  end

  def autocomplete
    render json: @client.completion, callback: params[:callback]
  end

  private
    def search_client
      @client = CombinedSearch.new(params.except(:action, :controller))
    end
end
