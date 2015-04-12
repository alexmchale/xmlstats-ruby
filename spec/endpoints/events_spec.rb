require "spec_helper"

describe Xmlstats::Endpoints::Events do

  it "returns 30 events on september 1, 2013" do
    VCR.use_cassette("events-all-20130901") do
      expect(Xmlstats.events(Date.parse("2013-09-01")).length).to eq(15)
    end
  end

  it "returns a list of event objects" do
    VCR.use_cassette("events-all-20130901") do
      expect(Xmlstats.events(Date.parse("2013-09-01")).map(&:class).uniq).to eq([ Xmlstats::Objects::Event ])
    end
  end

  it "updates the rate limit values" do
    VCR.use_cassette("events-all-20130901") do
      Xmlstats.events(Date.parse("2013-09-01"))

      expect(Xmlstats.limit_total).to eq(6)
      expect(Xmlstats.limit_remaining).to eq(5)
      expect(Xmlstats.limit_reset_time.to_i % 60).to eq(0)
    end
  end

end
