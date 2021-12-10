require "byebug"
class Flight

    attr_reader :passengers

    def initialize(number, capacity)
        @flight_number = number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !full?
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map {|each| each.name}
    end

    def[](i)
        return passengers[i]
    end

    def <<(passenger)
        board_passenger(passenger)
    end


end