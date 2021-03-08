require './classes/tournament.rb'

input = [
    'Team A 3 x 1 Team B',
    'Team C 0 x 0 Team D',
    'Team A 1 x 1 Team C',
    'Team B 2 x 3 Team D',
    'Team A 2 x 1 Team D',
    'Team B 3 x 1 Team C'
]

tournament = Tournament.new(input)

tournament.show_menu
tournament.run_tournament
tournament.show_table