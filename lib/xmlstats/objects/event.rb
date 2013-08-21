class Xmlstats::Objects::Event < Xmlstats::Object

  reference :away_team, Xmlstats::Objects::Team
  reference :home_team, Xmlstats::Objects::Team
  reference :site, Xmlstats::Objects::Site
  time :start_date_time

end
