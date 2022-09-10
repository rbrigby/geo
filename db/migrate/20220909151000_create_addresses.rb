class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      # Normal Lat/Lon columns
      # t.decimal :latitude, precision: 10, scale: 6
      # t.decimal :longitude, precision: 10, scale: 6
      # PostGIS column geometry column
      t.st_point :lonlat, geographic: true

      t.timestamps
    end
    # Normal index
    # add_index :addresses, [:latitude, :longitude]
    # PostGIS index
    add_index :addresses, :lonlat, using: :gist
  end
end
