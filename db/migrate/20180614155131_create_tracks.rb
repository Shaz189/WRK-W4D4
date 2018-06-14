class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false 
      t.string :title, null: false 
      t.integer :ord, null: false 
      t.boolean :bonus, default: false 
      t.string :lyrics
      t.timestamps
    end
  end
end
