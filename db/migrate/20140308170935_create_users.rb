class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :nickname
      t.string :email
      t.string :organizations_url
      t.boolean :active, default: false

      t.timestamps
    end
    add_index :users, [:provider, :uid], unique: true
  end
end
