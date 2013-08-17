module Xmlstats

  module Endpoint

    module InstanceMethods

      def initialize(data = {})
        data.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      def http_get_json
        self.class.http_get_json
      end

    end

    module ClassMethods

      def path= path
        @path = path
      end

      def http_get_json(path = nil)
        path ||= @path
        raise "path not defined" unless path

        uri = URI.parse("https://erikberg.com/#{path}.json")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        headers = {}
        api_key = Xmlstats.api_key
        headers["Authorization"] = "Bearer #{api_key}" if api_key
        request = Net::HTTP::Get.new(uri.path, headers)
        response = http.request(request)

        if response.kind_of? Net::HTTPOK
          response.body
        else
          raise "failed: #{response.inspect}"
        end
      end

      def fetch_json(path = nil)
        path ||= @path
        raise "path not defined" unless path

        json = http_get_json(path)
        JSON.load(json)
      end

    end

    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

  end

  module Endpoints
  end

end
