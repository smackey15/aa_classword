require "byebug"
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

    def grades
        @grades
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

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(string, num)
        if enrolled?(string)
            @grades[string] << num
            return true
        else
            return false
        end
    end

    def num_grades(string)
       @grades[string].length
    end

    def average_grade(string)
        if @grades[string].length > 0 && enrolled?(string)
            @grades[string].sum / @grades[string].length
        else
            nil
        end
    end

end

#ma = Bootcamp.new("Map Academy", "Anyone can be a cartographer.", 6)
#ma.enroll("Alice")
#ma.add_grade("Alice", 80)
#ma.grades
#p ma.grades
#p ma
#ma.num_grades("Alice")