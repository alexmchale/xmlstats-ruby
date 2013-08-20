class Xmlstats::Endpoints::NbaBoxScore

  include Xmlstats::Endpoint

  def self.fetch(event_id)
    response = fetch_json("nba/boxscore/#{event_id}")

    Xmlstats::Objects::NbaBoxScore.new response.merge(event_id: event_id)
  end

end
