$LOAD_PATH << File.expand_path("../lib", __FILE__)
require "xmlstats"
require "rspec"
require "vcr"

Xmlstats.http_getter  = Xmlstats::HttpGetters::NetHttp.new
Xmlstats.cacher       = nil
Xmlstats.api_key      = ENV["XMLSTATS_API_KEY"] || "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
Xmlstats.contact_info = ENV["XMLSTATS_CONTACT_INFO"] || "developer@example.com"

VCR.configure do |config|

  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock

  config.before_record do |i|
    i.response.headers.delete('Set-Cookie')
  end

  config.filter_sensitive_data "<API_KEY>" do
    ENV["XMLSTATS_API_KEY"]
  end

  config.filter_sensitive_data "<CONTACT_INFO>" do
    ENV["XMLSTATS_CONTACT_INFO"]
  end

end
