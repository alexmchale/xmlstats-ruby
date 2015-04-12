require "spec_helper"

describe Xmlstats::Endpoints::MlbTeams do

  it "gets 30 mlb teams" do
    VCR.use_cassette("endpoint/mlb_teams-all") do
      expect(Xmlstats.mlb_teams.length).to eq(30)
    end
  end

  it "gets a list of nothing but team objects" do
    VCR.use_cassette("endpoint/mlb_teams-all") do
      expect(Xmlstats.mlb_teams.map(&:class).uniq).to eq([ Xmlstats::Objects::Team ])
    end
  end

  it "includes the detroit tigers" do
    VCR.use_cassette("endpoint/mlb_teams-all") do
      expect(Xmlstats.mlb_teams.find { |team| team.full_name == "Detroit Tigers" }).not_to eq(nil)
    end
  end

end
