class Similarity
    def self.distance_between(source, comparison)
        raise "This method cannot compare to NilClass" if comparison.nil?
        n = source.length
        m = comparison.length
        max = n/2

        # Returns either word's length if one of them is empty
        return m if 0 == n
        return n if 0 == m

        # Checks if both words are equal and returns 0
        return 0 if source.eql? comparison

        d = (0..m).to_a
        x = nil
        source.each_char.with_index do |char1, i|
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