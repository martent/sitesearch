require 'spec_helper'

describe "Recommendations" do
  before :each do
    mock_auth_hash
  end

  it "should require authentication" do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit recommendations_path
    page.should have_selector('.error', text: "Inloggningen misslyckades")
  end

  it "should be available to authenticated users" do
    visit recommendations_path
    page.should have_selector('h1.box-title', text: "Rekommendatione")
  end
end
