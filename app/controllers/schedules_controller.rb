class SchedulesController < ApplicationController
    def index
        @schedules = Schedule.all

        render json: @schedules, status: :ok
    end

    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            render json: @schedule, status: :created
        else 
            render json: { 
                error: @schedule.errors.full_messages
                }, status: :unprocessable_entity
        end
    end


    private
    def schedule_params
        params.require(:schedule).permit(:flight_date, :start_time, :end_time, :origin_airport, :destination_airport, :available_seats, :total_seats, :flight_id)
    end
end
