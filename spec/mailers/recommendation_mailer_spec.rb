require 'spec_helper'

describe RecommendationMailer do
  after do
    Recommendation.destroy_all
  end

  describe ':check_links' do
    let(:mail) {
      RecommendationMailer.check_links(
        [message: 'failed', recommendation: create(:recommendation)]
      )
    }

    it 'renders the headers' do
      sleep 1
      expect(mail.subject).to eq('Länkkontroll')
      expect(mail.from.first).to match('noreply@malmo.se')
    end

    it 'renders the body' do
      sleep 1
      expect(mail.body.encoded).to match('Hej!')
    end
  end
end
