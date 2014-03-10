require 'open-uri'

class SearchController < ApplicationController
  def index
    @terms = params[:q]
    if @terms.present?
      begin
        cs = CombinedSearch.new(params.except(:action, :controller))
        @results = cs.search
      rescue Exception => e
        logger.error "Sitesearch: #{e}"
        @error = e
      end
    end

    if request.xhr?
      render :more, layout: false
    else
      render :index
    end
  end

  def autocomplete
    begin
      # Siteseeker is slow and indexing is only done at night so we cache hard
      results = Rails.cache.fetch(["search-autocomplete", params], expires_in: 12.hours) do
        open("#{APP_CONFIG['autocomplete_url']}?q=#{CGI.escape(params[:q])}&ilang=sv&callback=results", read_timeout: 1).first
      end
    rescue Exception => e
      logger.error "Siteseeker autocomplete: #{e}"
      # Silent error
      results = 'results({})'
    end
    render json: results
  end
end
