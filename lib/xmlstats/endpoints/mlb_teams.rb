class Xmlstats::Endpoints::MlbTeams

  include Xmlstats::Endpoint

  def self.fetch
    response = fetch_json("mlb/teams")

    response.map do |team|
      Xmlstats::Objects::Team.new team
    end
  end

end
