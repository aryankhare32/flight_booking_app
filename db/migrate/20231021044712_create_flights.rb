class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :flight_number
      t.integer :frequency
      

      t.timestamps
    end
  end
end
