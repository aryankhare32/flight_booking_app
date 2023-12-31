class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :schedule

    validates :user_id, :schedule_id, :seats, presence: true
end
