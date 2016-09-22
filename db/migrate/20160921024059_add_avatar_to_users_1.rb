class AddAvatarToUsers1 < ActiveRecord::Migration
  def change
  	    remove_column :users, :avatar, :json
  	    add_column :users, :avatar, :string
  end
end
