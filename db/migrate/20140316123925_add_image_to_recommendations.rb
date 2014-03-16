class AddImageToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :image, :string
  end
end
