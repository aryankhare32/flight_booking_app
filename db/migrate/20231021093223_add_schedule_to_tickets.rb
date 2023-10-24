class AddScheduleToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :schedule, null: false, foreign_key: true
  end
end
