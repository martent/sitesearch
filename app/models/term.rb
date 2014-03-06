class Term < ActiveRecord::Base
  belongs_to :recommendation
  validates :name, length: { maximum: 32 }

  before_save do
    self.name.downcase!
  end
end
