class Tournament
    attr_accessor :teams, :results

    def initialize (teams, results)
        @teams = teams
        @results = results
    end

    def standings
        @results.each { |result| 
            assignScore result
        }
        Hash[@teams.sort_by{|k, v| v}.reverse]
    end

    def assignScore result
        # {"A": 3, "B": 1},
        if result.values[0] == result.values[1]
            @teams[result.keys[0]] += 1
            @teams[result.keys[1]] += 1
        else
            winner = result.max_by{ |k, v| v }[0] # {"A", 3}
            @teams[winner] += 3
        end
    end

    def formattedStandings
        Hash[@teams.sort_by{|k, v| v}.reverse].each { |k, v| 
            puts "Team #{k} with #{v} points \n"
        }
    end

    def getWinner
        formattedStandings()
        puts "The winner is... Team #{@teams.max_by{|k,v| v}[0]}!!!"
    end
end

# Team A 3 x 1 Team B
# Team C 0 x 0 Team D
# Team A 1 x 1 Team C
# Team B 2 x 3 Team D
# Team A 2 X 1 Team D
# Team B 3 x 1 Team C

teams = {"A": 0, "B": 0, "C": 0, "D": 0}
results = [
    {"A": 3, "B": 1},
    {"C": 0, "D": 0},
    {"A": 1, "C": 1},
    {"B": 2, "D": 3},
    {"A": 2, "D": 1},
    {"B": 3, "C": 1}
]

tourney = Tournament.new teams, results
tourney.standings
tourney.getWinner
