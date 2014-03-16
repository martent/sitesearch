class Recommendation < ActiveRecord::Base
  include Recommendable
  mount_uploader :image, RecommendationImageUploader

  has_many :terms, dependent: :destroy
  accepts_nested_attributes_for :terms, allow_destroy: true

  validates :name,
    presence: { is: true, message: "Namnet måste fyllas i." },
    uniqueness: { is: true, message: "Det finns redan en rekommendation med det namnet." },
    length: { minimum: 2, maximum: 32 }
  validates :link,
    presence: { is: true, message: "Länk måste fyllas i." },
    uniqueness: { is: true, message: "Länken finns redan." },
    length: { minimum: 4, maximum: 255 }
  validates_associated :terms

  before_save do
    # Add protocol if missing
    self.link = "http://#{link}" unless link.match(/^https?:\/\//)
    self.link.strip!
  end
end
