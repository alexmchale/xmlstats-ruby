class Xmlstats::Endpoints::MlbStanding

  include Xmlstats::Endpoint

  attr_reader :date
  attr_reader :rank, :won, :lost, :streak, :ordinal_rank, :first_name, :last_name
  attr_reader :games_back, :points_for, :points_against, :home_won, :home_lost, :away_won, :away_lost
  attr_reader :conference_won, :conference_lost, :last_five, :last_ten, :conference, :division
  attr_reader :points_scored_per_game, :points_allowed_per_game, :win_percentage
  attr_reader :point_differential, :points_differential_per_game
  attr_reader :streak_type, :streak_total, :games_played

  def self.fetch(date = Date.today)
    date_str = date.strftime("%Y%m%d") unless date.kind_of? String
    response = fetch_json("mlb/standings/#{date_str}")
    standing = response["standing"]

    standing.map do |team|
      new team.merge("date" => date)
    end
  end

end
