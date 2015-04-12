class Xmlstats::Endpoints::MlbRoster

  include Xmlstats::Endpoint

  def self.fetch(team_id = nil, expanded = false)
    fail "please specify team_id as detailed in https://erikberg.com/api/issues/135" unless team_id

    params = {}

    params = { status: "expanded" } if expanded

    response = fetch_json("mlb/roster/#{team_id}", params)

    response["players"].map do |player_hash|
      Xmlstats::Objects::Player.new player_hash
    end
  end

end
