class Xmlstats::Objects::NbaBoxScore < Xmlstats::Object

  reference :home_team, Xmlstats::Objects::Team
  reference :away_team, Xmlstats::Objects::Team
  reference :home_stats, Xmlstats::Objects::BasketballStat
  reference :away_stats, Xmlstats::Objects::BasketballStat
  reference :officials, Xmlstats::Objects::Official
  reference :event_information, Xmlstats::Objects::EventInformation
  reference :home_totals, Xmlstats::Objects::BasketballStat
  reference :away_totals, Xmlstats::Objects::BasketballStat

end
