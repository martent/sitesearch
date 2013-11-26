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

  describe "results" do
    before(:each) do
      @query = "semester lön"
      visit "/?#{URI.encode_www_form(q: @query)}"
    end

    it "should have a prefilled form" do
      find("form#full-search input[name=q]").value.should include @query
    end

    it "should have a summary" do
      page.should have_selector(".summary", text: "Din sökning gav")
    end

    it "should have a sort menu" do
      page.should have_selector(".menu.sort", text: "relevans")
    end

    it "should have categories" do
      page.should have_selector(".categories")
    end

    it "should have hits for the main category in parenthesis" do
      find(".categories .all.current.group .hits").text.should match(/\(\d+\)/)
    end

    it "should have results" do
      page.should have_selector(".results")
    end

    it "should have results with linked headings" do
      page.should have_selector(".results > ul > li:first-child  h2 a")
    end

    it "should have a results entry with extracts" do
      page.should have_selector(".results > ul > li:first-child .extract")
    end

    it "should have a results entry with a category" do
      page.should have_selector(".results > ul > li:first-child .category")
    end

    it "should have a results entry a breadcrumb" do
      page.should have_selector(".results ul li .breadcrumb")
    end

    it "should have a load more link" do
      page.should have_selector("#load-more-search-results", text: "Visa fler")
    end

    # Run:
    # $ rake assets:precompile
    # $ RACK_ENV=production rspec
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
end
