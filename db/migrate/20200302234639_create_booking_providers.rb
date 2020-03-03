class CreateBookingProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_providers do |t|
      t.string :name
      t.string :website
      t.string :description
      t.string :category
      t.references :country, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
