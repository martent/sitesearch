require 'spec_helper'

describe Recommendation do
  after do
    Recommendation.destroy_all
  end

  it "should be created" do
    expect { create(:recommendation) }.to change(Recommendation, :count).by(+1)
  end

  it "should be valid" do
    build(:recommendation).should be_valid
  end

  it "should require a name" do
    build(:recommendation, name: "").should_not be_valid
  end

  it "should require a link" do
    build(:recommendation, link: "").should_not be_valid
  end

  it "should validate the length" do
    build(:recommendation, name: "fox barx" * 10).should_not be_valid
  end

  it "should validate the name uniqueness" do
    create(:recommendation, name: "fox")
    build(:recommendation, name: "fox").should_not be_valid
  end

  it "should validate the link uniqueness" do
    create(:recommendation, name: "example.org")
    build(:recommendation, name: "example.org").should_not be_valid
  end

  it "should add protocol to link" do
    create(:recommendation, link: "example2.org").link.should include("http://")
  end

  it "should have a term" do
    recommendation = build(:recommendation)
    recommendation.terms << build(:term)
    recommendation.terms.should be_present
  end

  it "should be destroyed" do
    recommendation = create(:recommendation)
    expect { recommendation.destroy }.to change(Recommendation, :count).by(-1)
  end

  it "should be destroy with terms" do
    recommendation = create(:recommendation)
    recommendation.terms << create(:term)
    expect { recommendation.destroy }.to change(Term, :count).by(-1)
  end
end
