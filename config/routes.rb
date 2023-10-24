Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :flights
  resources :schedules
  # search flights api
  get '/flights/:flight_date/:origin_airport/:destination_airport',  to: 'flights#search_flights'
  # get ticket history for user
  get '/users/tickets/:user_id', to: 'tickets#get_tickets_for_user'
  # book ticket for user api
  post '/users/tickets/book', to: 'tickets#book_ticket_for_user'
end
