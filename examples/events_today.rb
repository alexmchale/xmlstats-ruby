require "rubygems"
require "xmlstats"
require "date"

Xmlstats.api_key      = ENV["XMLSTATS_API_KEY"]
Xmlstats.contact_info = ENV["XMLSTATS_CONTACT_INFO"] || "alex@anticlever.com"

date = Date.today

printf("Events on %s\n\n", date.strftime("%A, %B %e, %Y"));
printf("%-35s %5s %34s\n", "Time", "Event", "Status");

Xmlstats.events(date).each do |event|
  printf("%-12s %24s vs. %-24s %9s\n",
    event.start_date_time.strftime("%l:%M %p"),
    event.away_team.full_name,
    event.home_team.full_name,
    event.event_status)
end
