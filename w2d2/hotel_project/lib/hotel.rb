require_relative "room"
require "byebug"
class Hotel

    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        mapped = @name.split(" ").map do |word|
            word.capitalize
        end
        mapped.join(" ")
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if  @rooms[room_name].add_occupant(person) 
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
         end

    end

    def has_vacancy?
        @rooms.each do |k, v|
            if v.available_space > 0
                return true
            end
        end
        false
    end

    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} : #{v.available_space}"
        end
    end

end
