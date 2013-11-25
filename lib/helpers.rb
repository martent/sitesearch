class Sitesearch < Sinatra::Base
  helpers do
    def partial(page, options={})
      haml "_#{page}".to_sym, options.merge!(:layout => false)
    end

    def asset_file(file)
      file = settings.asset_files[file] || file
      "#{settings.app_path}assets/#{file}"
    end

    def pluralize(count, singular, plural)
      word = count == 1 ? singular : plural
      "#{count || 0} #{word}"
    end

    def separator(current, total, question=false)
      separator = ", " if total > current + 2
      separator = " eller " if total == current + 2
      separator = "?" if total == current + 1 && question
      separator
    end
  end
end
