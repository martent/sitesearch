class Term < ActiveRecord::Base
  belongs_to :recommendation
  validates :name, length: { maximum: 32 }
end
