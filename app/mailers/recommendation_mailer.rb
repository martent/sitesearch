ActionMailer::Base.default_url_options = {
  host: APP_CONFIG['action_mailer_default_url_options_host'],
  protocol: 'https'
}

class RecommendationMailer < ActionMailer::Base
  def check_links(failures)
    @failures = failures
    to = User.all.map(&:email).join(', ')

    if to.present?
      mail(to: to,
           from: 'Malmö stads söktjänst <noreply@malmo.se>',
           subject: 'Länkkontroll')

    end
    puts "Link checker email send to #{to} at #{Time.new}"
  end
end
