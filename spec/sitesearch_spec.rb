# -*- coding: utf-8 -*-
require "spec_helper"
require "uri"

describe "Sitesearch", type: :feature do
  it "should not require login" do
    visit "/"
    current_path.should eq("/")
  end

  it "should have a search form" do
    visit "/"
    page.should have_selector('form#full-search')
  end

  it "should have a prefilled form" do
    query = "semester lön"
    visit "/?#{URI.encode_www_form(q: query)}"
    find('form#full-search input[name=q]').value.should include query
  end

  it "should display a results" do
    visit "/?#{URI.encode_www_form(q: 'semester lön')}"
    page.should have_selector('.results')
  end

  it "should have a load more link" do
    visit "/?q=semester"
    page.should have_selector('#load-more-search-results', text: "Visa fler")
  end

  if Capybara.app.settings.asset_files.size > 0
    it "should load more results", js: true do
      visit "/?q=semester"
      before = all("section.results li h2").count
      puts all("section.results li h2").count
      click_on("Visa fler")
      sleep 1
      before.should < all("section.results li h2").count
    end
  end
end
