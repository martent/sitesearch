class AddDescriptionToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :description, :text
  end
end
