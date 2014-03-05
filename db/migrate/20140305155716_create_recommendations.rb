class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
    add_index :recommendations, :name, :unique => true
  end
end
