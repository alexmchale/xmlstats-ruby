module Xmlstats

  module Endpoint

    module InstanceMethods

      def initialize(data = {})
        data.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      def http_get
        self.class.http_get
      end

    end

    module ClassMethods

      def path= path
        @path = path
      end

      def http_get(path = nil, params = {})
        path ||= @path
        raise "path not defined" unless path

        encoded_params =
          params.reject do |k, v|
            v == nil
          end.map do |k, v|
            "#{URI.escape k.to_s}=#{URI.escape v.to_s}"
          end.join("&")

        uri = URI.parse("https://erikberg.com/#{path}.json?#{encoded_params}")

        json = Xmlstats.cacher && Xmlstats.cacher.get(uri.to_s)
        return json if json

        json = Xmlstats.http_getter.get(uri)
        if json
          Xmlstats.cacher.set(uri.to_s, json)
          json
        end
      end

      def fetch_json(path = nil, params = {})
        path ||= @path
        raise "path not defined" unless path

        json = http_get(path, params)
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
