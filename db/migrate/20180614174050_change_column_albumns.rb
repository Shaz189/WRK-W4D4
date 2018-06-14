class ChangeColumnAlbumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :year 
    add_column :albums, :year, :integer, null: false
  end
end
