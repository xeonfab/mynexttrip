class ChangeCityFeaturesToBeFloatInScore < ActiveRecord::Migration[5.2]
  def change
    change_column :city_features, :score, :float
  end
end
