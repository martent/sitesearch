class RemoveOrganizationsUrlFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :organizations_url
  end

  def down
    add_column :users, :organizations_url, :string
  end
end
