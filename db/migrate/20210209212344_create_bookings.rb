class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :surfboard, null: false, foreign_key: true
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
