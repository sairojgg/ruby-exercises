class Team
    attr_accessor :team_name
    attr_reader :goals_scored, :goals_suffered, :victories, :losses, :draws, :points

    def initialize(team_name)
        @team_name      = team_name
        @goals_scored   = 0
        @goals_suffered = 0
        @victories      = 0
        @losses         = 0
        @draws          = 0
        @points         = 0
    end

    def add_goals_scored(goals)
        @goals_scored += goals
    end

    def add_goals_suffered(goals)
        @goals_suffered += goals
    end

    def add_victory()
        @victories += 1
        @points += 3
    end

    def add_defeat()
        @losses += 1
    end

    def add_draw()
        @draws += 1
        @points += 1
    end


    def self.extract_home_team_name(score_string)
        tmp = score_string.split(' x ')
        tmp[0] = tmp[0].split(' ')[1]
    end

    def self.extract_away_team_name(score_string)
        tmp = score_string.split(' x ')
        tmp[1] = tmp[1].split(' ')[2]
    end
end