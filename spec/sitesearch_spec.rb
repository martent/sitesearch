# -*- coding: utf-8 -*-
require "spec_helper"

describe "Sitesearch" do
  it "should allow accessing the home page" do
    get '/'
    last_response.should be_ok
  end

  it "should have a number of hits" do
    @client = SiteseekerNormalizer::Client.new("malmo", "webb")
    @response = @client.search("barnomsorg")
    @response.total.should be_a Fixnum
  end
end
