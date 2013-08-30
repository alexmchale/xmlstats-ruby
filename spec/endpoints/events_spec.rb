require "spec_helper"

describe Xmlstats::Endpoints::Events do

  it "returns 30 events on september 1, 2013" do
    VCR.use_cassette("events-all-20130901") do
      Xmlstats.events(Date.parse("2013-09-01")).should have(15).items
    end
  end

  it "returns a list of event objects" do
    VCR.use_cassette("events-all-20130901") do
      Xmlstats.events(Date.parse("2013-09-01")).map(&:class).uniq.should == [ Xmlstats::Objects::Event ]
    end
  end

end
