class Xmlstats::Endpoints::NbaLeaders

  CATEGORIES = %w(
    points_per_game
    assists_per_game
    rebounds_per_game
    off_rebounds_per_game
    def_rebounds_per_game
    field_goal_pct
    free_throw_pct
    three_point_pct
    blocks_per_game
    steals_per_game
    assists_to_turnovers_per_game
    steals_to_turnovers_per_game
    minutes_per_game
    games_played
  )

  include Xmlstats::Endpoint

  def self.fetch(category_id, options = {})
    unless CATEGORIES.include? category_id.to_s
      raise "unknown category id #{category_id.inspect}, must be one of: #{CATEGORIES.inspect}"
    end

    response = fetch_json("nba/leaders/#{category_id}", options)

    response.map do |leader|
      Xmlstats::Objects::NbaLeader.new leader.merge(category_id: category_id.to_s)
    end
  end

end
