class AddUserIdToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :user_id, :integer
  	remove_column :users, :listing_id
  end
end
