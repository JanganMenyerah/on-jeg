class Order < ApplicationRecord
    validates :pick_up_location, presence: true
    validates :destination_location, presence: true

end
