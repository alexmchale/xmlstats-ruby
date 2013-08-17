module Xmlstats::Endpoint

  module InstanceMethods

    def http_get_json
      self.class.http_get_json
    end

  end

  module ClassMethods

    def self.path= path
      @path = path
    end

    def self.http_get_json
      raise "endpoint path not defined" unless @path

      uri = URI.parse("https://erikberg.com/#{@path}.json")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      headers = {}
      headers["Authorization"] = "Bearer #{api_key}" if api_key
      request = Net::HTTP::Get.new(uri.path, headers)
      response = http.request(request)

      if response.kind_of? Net::HTTPOK
        response.body
      else
        raise "failed: #{response.inspect}"
      end
    end

  end

  def self.included(base)
    base.send :include, InstanceMethods
    base.send :extend, ClassMethods
  end

end
