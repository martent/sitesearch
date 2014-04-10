class SearchController < ApplicationController
  protect_from_forgery except: :autocomplete
  before_action :search_client

  def index
    @terms = params[:q]
    if @terms.present?
      response = @client.search
      @results = response[:sitesearch]
      @recommendations = response[:recommendations]
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
