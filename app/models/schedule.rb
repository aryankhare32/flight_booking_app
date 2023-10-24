class Schedule < ApplicationRecord
    belongs_to :flight
    has_many :tickets
    validates :flight_date, :start_time, :end_time, :origin_airport, :destination_airport, :available_seats, :total_seats, presence: true
end
