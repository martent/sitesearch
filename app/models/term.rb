class Term < ActiveRecord::Base
  belongs_to :recommendation
  validates :name, length: { minimum: 2, maximum: 32 }

  before_save do
    self.name.downcase!
    self.name.strip!
  end
end
