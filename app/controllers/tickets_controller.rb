class TicketsController < ApplicationController
    
    def book_ticket_for_user 
        seats = params[:ticket][:seats]
        schedule = Schedule.where("id = ?", params[:ticket][:schedule_id]).first
        if schedule[:available_seats] >= seats
            @ticket = Ticket.new(ticket_params)
            save_booking(schedule, seats) # handles the capacity available
        else  
            render json: "No seats available", status: :unprocessable_entity
        end
        
    end
    
    def get_tickets_for_user
        tickets = Ticket.where("user_id = ?", params[:user_id])
        response = build_response(tickets)

        render json: response, status: :ok
    end

    private 
        def ticket_params
            params.require(:ticket).permit(:user_id, :schedule_id, :seats)
        end

        def save_booking(schedule, seats)
            if @ticket.save
                schedule[:available_seats] = schedule[:available_seats] - seats
                schedule.save
                render json: @ticket, status: :created
            else 
                render json: { 
                    error: @ticket.errors.full_messages
                    }, status: :unprocessable_entity
            end
        end

        def build_response(tickets)
            response = []
            tickets.each do |ticket|
                user = ticket.user
                schedule = ticket.schedule
                flight = schedule.flight
                response_object = {
                    first_name: user[:first_name],
                    last_name: user[:last_name],
                    flight_number: flight[:flight_number],
                    flight_date: schedule[:flight_date],
                    airline: flight[:airline],
                    seats: ticket[:seats],
                    departure_time: schedule[:start_time],
                    arrival_time: schedule[:end_time]
    
                }
                response << response_object
            end
        end
end
