class Xmlstats::Endpoints::NbaTeams

  include Xmlstats::Endpoint

  def self.fetch
    response = fetch_json("nba/teams")

    response.map do |team|
      Xmlstats::Objects::Team.new team
    end
  end

end
