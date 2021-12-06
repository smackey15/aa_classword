class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|h, k| h[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end
    
    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(string)
        @teachers << string
    end

    def enroll(string)
        if @students.length < @student_capacity
            @students << string
            return true
        end
        if @students.length == @student_capacity
            return false
        end
    end

    def enrolled?(string)
        @students.include?(string)

    end

end
