class AddFlightToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :flight, null: false, foreign_key: true
  end
end
