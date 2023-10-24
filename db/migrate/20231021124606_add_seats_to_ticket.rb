class AddSeatsToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :seats, :integer
  end
end
