require 'resolv-replace'
require 'net/http'

desc 'Check recommendation URIs'
task check_links: :environment do
  failures = []

  Recommendation.all.each do |recommendation|
    begin
      check_link recommendation.link
    rescue StandardError => e
      failures.push message: e.message, recommendation: recommendation
    end
  end
  RecommendationMailer.check_links(failures).deliver if failures.present?
end

def check_link(link, redirected = 0)
  fail StandardError, "Too many redirects (#{redirected})" if redirected >= 5

  uri = URI link

  Net::HTTP.start(uri.host, uri.port,
                  open_timeout: 10,
                  read_timeout: 10,
                  use_ssl: uri.scheme == 'https',
                  verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|

    request  = Net::HTTP::Get.new uri
    response = http.request request

    case response
    when Net::HTTPSuccess then
      return true
    when Net::HTTPRedirection then
      check_link response['location'], redirected + 1
    else
      fail StandardError, response.value
    end
  end
end
