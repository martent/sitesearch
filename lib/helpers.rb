class Sitesearch < Sinatra::Base
  helpers do
    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end

    def pluralize(count, singular, plural)
      word = count == 1 ? singular : plural
      "#{count || 0} #{word}"
    end
  end
end