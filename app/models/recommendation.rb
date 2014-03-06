class Recommendation < ActiveRecord::Base
  has_many :terms

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

  # Term names as tokens
  def term_list
    terms.map(&:name).join(", ")
  end

  def term_list=(names)
    self.terms.destroy_all
    self.terms = names.split(",").map do |n|
      t = Term.where(name: n.downcase.strip, "recommendation_id" => id).first_or_create
    end.compact
  end
end
