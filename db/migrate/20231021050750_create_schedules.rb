class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :flight_date
      t.time :start_time
      t.time :end_time
      t.string :origin_airport
      t.string :destination_airport
      t.integer :available_seats
      t.integer :total_seats

      t.timestamps
    end
  end
end
