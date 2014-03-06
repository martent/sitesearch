class Recommendation < ActiveRecord::Base
  has_many :terms
  accepts_nested_attributes_for :terms, allow_destroy: true

  validates :name,
    presence: { is: true, message: "Namnet måste fyllas i." },
    uniqueness: { is: true, message: "Det finns redan en rekommendation med det namnet." },
    length: { maximum: 32 }
  validates :link,
    presence: { is: true, message: "Länk måste fyllas i." },
    uniqueness: { is: true, message: "Länken finns redan." },
    length: { maximum: 255 }
  validates_associated :terms

  before_save do
    # Add protocol if missing
    self.link = "http://#{link}" unless link.match(/^https?:\/\//)
  end
end
