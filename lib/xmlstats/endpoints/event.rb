class Xmlstats::Endpoints::Event

  include Xmlstats::Endpoint

  attr_reader :date
  attr_reader :event_id, :event_status
  attr_reader :sport, :start_date_time, :season_type
  attr_reader :away_team, :home_team, :site

  def initialize(*)
    super
    @away_team = Team.new(@away_team)
    @home_team = Team.new(@home_team)
    @site = Site.new(@site)
  end

  def self.fetch(date = Date.today, sport = nil)
    date_str = date.strftime("%Y%m%d") unless date.kind_of? String
    params = { date: date_str, sport: sport }
    response = fetch_json("events", params)

    response["event"].map do |event|
      new event.merge("date" => date)
    end
  end

  class Team
    include Xmlstats::Endpoint
  end

  class Site
    include Xmlstats::Endpoint
  end

end
