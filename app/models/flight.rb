class Flight < ApplicationRecord
    has_many :schedules
    
    validates :airline, :flight_number, :frequency, presence: true
end
