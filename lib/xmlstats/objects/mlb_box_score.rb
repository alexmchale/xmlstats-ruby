class Xmlstats::Objects::MlbBoxScore < Xmlstats::Object

  reference :home_team, Xmlstats::Objects::Team
  reference :away_team, Xmlstats::Objects::Team
  reference :home_batters, Xmlstats::Objects::Batter
  reference :away_batters, Xmlstats::Objects::Batter
  reference :home_pitchers, Xmlstats::Objects::Pitcher
  reference :away_pitchers, Xmlstats::Objects::Pitcher
  reference :officials, Xmlstats::Objects::Official
  reference :event_information, Xmlstats::Objects::EventInformation
  reference :home_batter_totals, Xmlstats::Objects::Batter
  reference :away_batter_totals, Xmlstats::Objects::Batter

end
