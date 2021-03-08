require './classes/match.rb'
require './classes/team.rb'

class Tournament
	def initialize(input)
        @matches    = []
        @scores     = input
        @teams      = {}
    end

	def show_menu()
		puts [
			'Tournament',
			'Insert scores in the "Team <letter> <number> x <number> Team <letter>" format',
			'Type "Exit" to exit and see the tournament table'
		]

		loop do
			puts 'Enter score:'
			input = gets.chomp
			break if input == 'Exit'
			@scores.push input
		end
	end

    private def extract_teams()
        home_team = ''
        away_team = ''

        @scores.each do |score_string|
            home_team = Team.extract_home_team_name score_string
            away_team = Team.extract_away_team_name score_string

            if(!@teams.key?(home_team))
                @teams[home_team] = Team.new(home_team)
            end

            if(!@teams.key?(away_team))
                @teams[away_team] = Team.new(away_team)
            end
        end
    end

    private def run_matches()
        @scores.each do |score_string|
            home_team = Team.extract_home_team_name score_string
            away_team = Team.extract_away_team_name score_string

            home_team = @teams[home_team]
            away_team = @teams[away_team]

            @matches.push Match.new(home_team, away_team, score_string)
        end
    end

	def run_tournament()
        self.extract_teams
        self.run_matches
	end

	def show_table()
		@teams.sort_by { |team_name, team_numbers| team_numbers.points }.reverse.each do |team_name, team_numbers|
            puts "Team: " + team_name + " | Points: " + team_numbers.points.to_s
        end
	end
end