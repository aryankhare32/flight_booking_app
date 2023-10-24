class FlightsController < ApplicationController
    def index
        @flights = Flight.all

        render json: @flights, status: :ok
    end

    def create
        @flight = Flight.new(flight_params)
        if @flight.save
            render json: @flight, status: :created
        else 
            render json: { 
                error: @flight.errors.full_messages
                }, status: :unprocessable_entity
        end
    end

    def search_flights
        @schedules = Schedule.where(flight_date: params[:flight_date], origin_airport: params[:origin_airport], destination_airport: params[:destination_airport])
        response = build_response
        if response.present?
            render json: response, status: :ok
        else
            render json: {message: 'No matching flights found'}, status: :ok
        end

        
    end
    private
    def flight_params
        params.require(:flight).permit(:airline, :flight_number, :frequency)
    end

    def build_response
        response = []
        @schedules.each do |schedule|
            flight = schedule.flight
            response_item = {
                schedule_id: schedule[:id],
                flight_date: schedule[:flight_date],
                origin_airport: schedule[:origin_airport],
                destination_airport: schedule[:destination_airport],
                available_seats: schedule[:available_seats],
                flight_number: flight[:flight_number],
                frequency: flight[:frequency]
            }
            response << response_item
        end
    end

    def search_flight_params

    end
end
