require 'spec_helper'

describe Recommendation do
  after do
    Recommendation.destroy_all
  end

  it "should be created" do
    expect { create(:recommendation) }.to change(Recommendation, :count).by(+1)
  end

  it "should be valid" do
    expect(build(:recommendation)).to be_valid
  end

  it "should require a name" do
    expect(build(:recommendation, name: "")).not_to be_valid
  end

  it "should require a link" do
    expect(build(:recommendation, link: "")).not_to be_valid
  end

  it "should validate the name length" do
    expect(build(:recommendation, name: "fox barx" * 10)).not_to be_valid
  end

  it "should validate the name uniqueness" do
    create(:recommendation, name: "fox")
    expect(build(:recommendation, name: "fox")).not_to be_valid
  end

  it "should validate the description length" do
    expect(build(:recommendation, description: "123456789 " * 13)).not_to be_valid
  end

  it "should validate the link uniqueness" do
    create(:recommendation, name: "example.org")
    expect(build(:recommendation, name: "example.org")).not_to be_valid
  end

  it "should add protocol to link" do
    expect(create(:recommendation, link: "example2.org").link).to include("http://")
  end

  it "should have a term" do
    recommendation = build(:recommendation)
    recommendation.terms << build(:term)
    expect(recommendation.terms).to be_present
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
