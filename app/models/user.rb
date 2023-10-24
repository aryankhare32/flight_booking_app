class User < ApplicationRecord
    has_one :ticket
    validates :first_name, :last_name, :email, presence: true
end
