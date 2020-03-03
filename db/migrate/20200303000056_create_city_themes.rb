class CreateCityThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :city_themes do |t|
      t.references :city, foreign_key: true
      # t.references :theme, foreign_key: true
      t.string :January
      t.string :February
      t.string :March
      t.string :April
      t.string :May
      t.string :June
      t.string :July
      t.string :August
      t.string :September
      t.string :October
      t.string :November
      t.string :December

      t.timestamps
    end
  end
end
