class Xmlstats::Endpoints::MlbBoxScore

  include Xmlstats::Endpoint

  def self.fetch(event_id = nil)
    raise "please specify event_id as detailed in https://erikberg.com/api#boxscore" unless event_id

    response = fetch_json("mlb/boxscore/#{event_id}")

    Xmlstats::Objects::MlbBoxScore.new response.merge(event_id: event_id)
  end

end
