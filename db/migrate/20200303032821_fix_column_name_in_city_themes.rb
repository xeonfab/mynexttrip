class FixColumnNameInCityThemes < ActiveRecord::Migration[5.2]
  def change
    change_table :city_themes do |t|
      t.rename :January, :january
      t.rename :February, :february
      t.rename :March, :march
      t.rename :April, :april
      t.rename :May, :may
      t.rename :June, :june
      t.rename :July, :july
      t.rename :August, :august
      t.rename :September, :september
      t.rename :October, :october
      t.rename :November, :november
      t.rename :December, :december
    end
  end
end
