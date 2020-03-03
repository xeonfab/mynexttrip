class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
