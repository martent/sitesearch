require 'spec_helper'

describe "RecommendationImageUploader" do
  include CarrierWave::Test::Matchers

  before do
    RecommendationImageUploader.enable_processing = true
    @recommendation = build(:recommendation)
    @uploader = RecommendationImageUploader.new(@recommendation, :image)
    @uploader.store!(File.open("spec/samples/recommendation_image.jpg"))
  end

  after do
    RecommendationImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      @uploader.mini.should be_no_wider_than(100)
    end
  end

  context 'the mini version' do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      @uploader.mini.should be_no_wider_than(32)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0644)
  end
end
