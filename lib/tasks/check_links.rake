require 'net/http'

desc 'Check recommendation URIs'
task check_links: :environment do
  Recommendation.all.each do |recommendation|
    # recommendation.id
    # recommendation.name
    # recommendation.link
    begin
      check_link recommendation.link
    rescue StandardError => e
      puts "  ERROR: #{e.message}"
    end
  end
end

def check_link(link, limit = 10)
  puts "Checking: #{link}"
  fail StandardError, 'too many HTTP redirects' if limit == 0

  uri = URI(link)

  Net::HTTP.start(uri.host, uri.port,
                  open_timeout: 10,
                  read_timeout: 10,
                  use_ssl: uri.scheme == 'https',
                  verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|

    request = Net::HTTP::Get.new uri
    response = http.request request

    case response
    when Net::HTTPSuccess then
      return true
    when Net::HTTPRedirection then
      check_link(response['location'], limit - 1)
    else
      fail StandardError, response.value
    end
  end
end
