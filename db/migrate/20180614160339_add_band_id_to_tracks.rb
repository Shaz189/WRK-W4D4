class AddBandIdToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :band_id, :integer, null: false 
  end
end
