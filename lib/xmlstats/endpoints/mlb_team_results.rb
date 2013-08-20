class Xmlstats::Endpoints::MlbTeamResults

  include Xmlstats::Endpoint

  def self.fetch(team_id)
    response = fetch_json("mlb/team/#{team_id}/results")
    [ response ].flatten.map do |result|
      Xmlstats::Objects::TeamResult.new result
    end
  end

end
