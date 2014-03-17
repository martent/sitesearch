require 'spec_helper'

describe "Recommendations" do
  describe "GET /recommendations" do
    it "works! (now write some real specs)" do
      get recommendations_path
      response.status.should be(200)
    end
  end
end
