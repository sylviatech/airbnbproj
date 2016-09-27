class AddGuestToListings < ActiveRecord::Migration
  def change
    add_column :listings, :guest, :integer
  end
end
