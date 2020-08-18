class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :instrument, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :check_in_date
      t.date :check_out_date
      t.integer :rental_price_total
      t.integer :rental_fees
      t.integer :transfer_date

      t.timestamps
    end
  end
end
