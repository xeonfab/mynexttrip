class CreateCityFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :city_features do |t|
      t.references :city, foreign_key: true
      # t.references :feature, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
