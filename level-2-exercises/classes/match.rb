class Match
    def initialize(home_team, away_team, score_string)
        home_team_score = get_home_team_score(score_string)
        away_team_score = get_away_team_score(score_string)

        home_team.add_goals_scored home_team_score
        away_team.add_goals_scored away_team_score

        home_team.add_goals_suffered home_team_score
        away_team.add_goals_suffered away_team_score

        if(home_team_score > away_team_score)
            home_team.add_victory
            away_team.add_defeat
        elsif (home_team_score > away_team_score)
            home_team.add_defeat
            away_team.add_victory
        else
            home_team.add_draw
            away_team.add_draw
        end
    end

    def get_home_team_score(score_string)
        score_string.split(' x ')[0].split(' ')[2].to_i
    end

    def get_away_team_score(score_string)
        score_string.split(' x ')[1].split(' ')[0].to_i
    end
end