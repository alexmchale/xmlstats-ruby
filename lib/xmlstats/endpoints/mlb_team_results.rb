class Xmlstats::Endpoints::MlbTeamResults

  include Xmlstats::Endpoint

  def self.fetch(team_id = nil, season = nil)
    raise "please specify team_id as detailed in https://erikberg.com/api#teamresults" unless team_id
    params = { season: season }
    response = fetch_json("mlb/team/#{team_id}/results", params)
    [ response ].flatten.map do |result|
      Xmlstats::Objects::TeamResult.new result
    end
  end

end
