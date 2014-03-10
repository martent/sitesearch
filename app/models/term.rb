class Term < ActiveRecord::Base
  belongs_to :recommendation, touch: true
  validates :name, length: { minimum: 2, maximum: 32 }

  before_save do
    self.name.downcase!
    self.name.strip!
  end
end
