class AddReferencesToCities < ActiveRecord::Migration[5.2]
  def change
    add_reference :city_features, :feature, foreign_key: true
    add_reference :city_themes, :theme, foreign_key: true
  end
end
