class RecommendationMailer < ActionMailer::Base

  def check_links(failures)
    @failures = failures

    mail to: User.all.map(&:email).join(', '),
         from: 'Malmö stads söktjänst <noreply@malmo.se>',
         subject: 'Länkkontroll'
  end
end
