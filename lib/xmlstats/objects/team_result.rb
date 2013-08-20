class Xmlstats::Objects::TeamResult < Xmlstats::Object

  reference :team, Xmlstats::Objects::Team
  reference :opponent, Xmlstats::Objects::Team
  reference :site, Xmlstats::Objects::Site

end
