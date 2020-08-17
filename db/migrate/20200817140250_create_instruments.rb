class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pickup_address
      t.string :category
      t.integer :price_per_day
      t.text :description

      t.timestamps
    end
  end
end
