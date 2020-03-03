class ChangeColumnsInClimates < ActiveRecord::Migration[5.2]
  def change
    change_column :climates, :january, :integer, using: 'january::integer', default: 0
    change_column :climates, :february, :integer, using: 'february::integer', default: 0
    change_column :climates, :march, :integer, using: 'march::integer', default: 0
    change_column :climates, :april, :integer, using: 'april::integer', default: 0
    change_column :climates, :may, :integer, using: 'may::integer', default: 0
    change_column :climates, :june, :integer, using: 'june::integer', default: 0
    change_column :climates, :july, :integer, using: 'july::integer', default: 0
    change_column :climates, :august, :integer, using: 'august::integer', default: 0
    change_column :climates, :september, :integer, using: 'september::integer', default: 0
    change_column :climates, :october, :integer, using: 'october::integer', default: 0
    change_column :climates, :november, :integer, using: 'november::integer', default: 0
    change_column :climates, :december, :integer, using: 'december::integer', default: 0
  end
end
