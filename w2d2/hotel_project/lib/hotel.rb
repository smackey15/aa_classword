require_relative "room"
require "byebug"
class Hotel

    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = Hash.new {|h, k| h[hash[k]] = Room.new }
    end

    def name
        @name = @name.capitalize
        #words = @name.split
        #words.each {|word| word.capitalize}
        #up_name = words.join(" ")
    end

    def room_exists?(room_name)
        if hash.has_key?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)

    end

    def has_vacancy?
    end

    def list_rooms
    end

end
