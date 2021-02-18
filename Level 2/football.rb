class Team
    attr_accessor :name, :points
    def initialize name
        @name = name
        @points = 0
    end
end

class Match
    def initialize(home_team, home_score, away_team, away_score)
      @home_team = home_team
      @home_score = home_score
      @away_team = away_team
      @away_score = away_score
    end

    def calculate_result?
        if @home_score > @away_score
            @home_team.points += 3
            @winner = @home_team
        elsif @home_score < @away_score
            @away_team.points += 3
            @winner = @away_team
        else
            @home_team.points += 1
            @away_team.points += 1
            @winner = "Tie"
        end
    end

    def to_s
        if @winner == "Tie"
            "The match between #{@home_team.name} and #{@away_team.name} was a tie."
        elsif @winner == nil
            "The match hasn't been played yet"
        else
            "The winner is #{@winner.name}"
        end
    end
end
class Tournament
    attr_accessor :teams, :matches

    def initialize (teams, matches)
        @teams = teams
        @matches = matches
        @winner = nil
    end

    def standings
        @matches.each { |match| 
            match.calculate_result?
        }
        @teams.sort_by!{ |team| team.points }.reverse
    end

    def formatted_standings
        standings.each { |standing|
            puts "Team #{standing.name} with #{standing.points} points \n"
        }
    end

    def get_winner
        @winner = "Team #{@teams.max_by{|team| team.points}.name}"
    end
end

teamA = Team.new "A"
teamB = Team.new "B"
teamC = Team.new "C"
teamD = Team.new "D"
teams = [teamA, teamB, teamC, teamD]

matches = []
matches << Match.new(teamA, 3, teamB, 1)
matches << Match.new(teamC, 0, teamD, 0)
matches << Match.new(teamA, 1, teamC, 1)
matches << Match.new(teamB, 2, teamD, 3)
matches << Match.new(teamA, 2, teamD, 1)
matches << Match.new(teamB, 3, teamC, 1)

tourney = Tournament.new(teams, matches)
tourney.formatted_standings
tourney.get_winner
