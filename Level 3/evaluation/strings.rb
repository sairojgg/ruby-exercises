=begin
Ruby Development Program - Level 3 Code Evaluation
Statement
Create a method that, given two strings A and B, it returns the amount of modifications (adding, removing or replacing a character) 
required to turn A into B. If A and B are equals, the method should return 0. It should be used as:
"bananas".distance_to("ananas") # => 1
"parrot".distance_to("parrot") # => 0
"parrot".distance_to("torrap") # => 4
If any String B is nil, it should throw an error message, informing the user that the method cannot compare to NilClass. 
This method also accepts receiving a block of code as a parameter in order to override the default distance calculation 
algorithm for another one the user prefers:
"bananas".distance_to("ananas") do |other|
     other.length
end # => 6
=end

class String
    def distance_to_s(comparison)
        return "The distance between #{self} and #{comparison} is #{calculate_distance(comparison)}"
    end

    def distance_to(comparison)
        if block_given?
            yield(comparison)
        else
            calculate_distance(comparison)
        end
    end

    private def calculate_distance(comparison)
        raise "This method cannot compare to NilClass" if comparison.nil?
        n = self.length
        m = comparison.length
        max = n/2

        # Returns either word's length if one of them is empty
        return m if 0 == n
        return n if 0 == m

        # Checks if both words are equal and returns 0
        return 0 if self.eql? comparison

        d = (0..m).to_a
        x = nil
        self.each_char.with_index do |char1, i|
            e = i+1
            comparison.each_char.with_index do |char2, j|
                cost = (char1 == char2) ? 0 : 1
                x = 
                [
                    d[j+1] + 1, # insertion
                    e + 1,      # deletion
                    d[j] + cost # substitution
                ].min
                d[j] = e
                e = x
            end
            d[m] = x
        end
        return x
    end
end

puts "bananas".distance_to_s("ananas") # => 1
puts "parrot".distance_to_s("parrot") # => 0
puts "parrot".distance_to_s("torrap") # => 4
puts "kitten".distance_to_s("sitting") # => 4
puts "Saturday".distance_to_s("Sunday") # => 4


"bananas".distance_to("ananas") do |other|
    puts other.length
end
