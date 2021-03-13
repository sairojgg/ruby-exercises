require_relative '../tournament'

describe 'In a Football Tournament,' do
  before do
    @home_team = Team.new(home_team)
    @away_team = Team.new(away_team)
  end

  context 'Team A vs Team B play a couple of matches, ' do
    let(:home_team) { 'Team A' }
    let(:away_team) { 'Team B' }

    it 'Home team is Team A' do
      expect(@home_team.to_s).to eq 'Team A'
    end

    it 'Away team is Team B' do
      expect(@away_team.to_s).to eq 'Team B'
    end

    it 'Team A wins and gets 3 points' do
      @home_team.play(Match.new(@home_team, @away_team, 3, 1))
      expect(@home_team.total_points).to eq 3
    end

    it 'Team A ties and gets 1 point' do
      @home_team.play(Match.new(@home_team, @away_team, 1, 1))
      expect(@home_team.total_points).to eq 1
    end

    it 'Team A loses' do
      @home_team.play(Match.new(@home_team, @away_team, 0, 1))
      expect(@home_team.total_points).to eq 0
    end
  end
end
