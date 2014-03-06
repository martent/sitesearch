class Recommendation < ActiveRecord::Base
  has_many :terms

  validates :name,
    presence: { is: true, message: "Namnet måste fyllas i." },
    uniqueness: { is: true, message: "Det finns redan en rekommendation med det namnet." },
    length: { maximum: 32 }
  validates_associated :terms
end
