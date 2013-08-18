class Xmlstats::Endpoints::Event

  include Xmlstats::Endpoint

  def self.fetch(date = Date.today, sport = nil)
    date_str = date.strftime("%Y%m%d") unless date.kind_of? String
    params = { date: date_str, sport: sport }
    response = fetch_json("events", params)

    response["event"].map do |event|
      Xmlstats::Objects::Event.new event.merge(date: date)
    end
  end

end
