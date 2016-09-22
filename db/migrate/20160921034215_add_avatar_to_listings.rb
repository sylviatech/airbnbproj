class AddAvatarToListings < ActiveRecord::Migration
  def change
    add_column :listings, :avatar, :json
  end
end
