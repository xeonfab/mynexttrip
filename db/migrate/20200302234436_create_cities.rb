class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :country, foreign_key: true
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
