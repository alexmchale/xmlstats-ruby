class Xmlstats::Endpoints::MlbStanding

  def self.fetch(date = Date.today)
    date = date.strftime("%Y%m%d")
    json = Xmlstats.http_get_json("mlb/standings/#{date}")
    JSON.load(json).map { |e| new e }
  end

end
