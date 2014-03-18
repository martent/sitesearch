require 'spec_helper'

describe "Recommendations" do
  before do
    create(:recommendation)
    mock_auth_hash
  end

  it "should require authentication" do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit recommendations_path
    page.should have_selector '.error', text: "Inloggningen misslyckades"
  end

  describe "administration" do
    before :each do
      visit recommendations_path
    end

    it "should be available to authenticated users" do
      page.should have_selector 'h1.box-title', text: "Rekommendationer"
    end

    it "should have a create form" do
      click_on "Lägg till"
      page.should have_selector 'h1.box-title', text: "Ny rekommendation"
    end

    it "should validate form" do
      click_on "Lägg till"
      fill_in 'Namn', with: 'Fox-1'
      fill_in 'Länk', with: 'example.org'
      fill_in 'recommendation_terms_attributes_0_name', with: ''
      click_on "Spara"
      page.should have_selector '.warning', text: "Vänligen korrigera"
    end

    it "should save the form" do
      click_on "Lägg till"
      fill_in 'Namn', with: 'Barx'
      fill_in 'Länk', with: 'example.org'
      fill_in 'recommendation_terms_attributes_0_name', with: 'Boom'
      click_on "Spara"
      page.should have_selector '.notice', text: "Rekommendationen sparades"
    end

    it "should have an edit form" do
      first('section.box table tbody td a').click
      page.should have_selector 'h1.box-title', text: "Redigera"
    end

    it "should validate term", js: true do
      first('section.box table tbody tr td a').click
      click_on "Lägg till"
      click_on "Spara"
      page.should have_selector '.warning', text: "Vänligen korrigera"
    end

    it "should add term", js: true do
      visit recommendations_path
      first('section.box table tbody tr td a').click
      click_on "Lägg till"
      all(".recommendation_terms_name input.string").last.set "Boom"
      click_on "Spara"
      page.should have_selector('.notice', text: "Rekommendationen sparades")
    end
  end
end
