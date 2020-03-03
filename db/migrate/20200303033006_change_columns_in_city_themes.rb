class ChangeColumnsInCityThemes < ActiveRecord::Migration[5.2]
  def change
    change_column :city_themes, :january, :integer, using: 'january::integer', default: 0
    change_column :city_themes, :february, :integer, using: 'february::integer', default: 0
    change_column :city_themes, :march, :integer, using: 'march::integer', default: 0
    change_column :city_themes, :april, :integer, using: 'april::integer', default: 0
    change_column :city_themes, :may, :integer, using: 'may::integer', default: 0
    change_column :city_themes, :june, :integer, using: 'june::integer', default: 0
    change_column :city_themes, :july, :integer, using: 'july::integer', default: 0
    change_column :city_themes, :august, :integer, using: 'august::integer', default: 0
    change_column :city_themes, :september, :integer, using: 'september::integer', default: 0
    change_column :city_themes, :october, :integer, using: 'october::integer', default: 0
    change_column :city_themes, :november, :integer, using: 'november::integer', default: 0
    change_column :city_themes, :december, :integer, using: 'december::integer', default: 0
  end
end
