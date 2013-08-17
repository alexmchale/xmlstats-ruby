module Xmlstats

  module Endpoint

    module InstanceMethods

      def initialize(data = {})
        data.each do |key, value|
          instance_variable_set("@#{key}", value)
          (class << self; self; end).class_eval do
            define_method(key) { instance_variable_get "@#{key}" }
          end
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

        json = Xmlstats.cacher && Xmlstats.cacher.get(uri.path)
        return json if json

        json = Xmlstats.http_getter.get(uri)
        if json
          Xmlstats.cacher.set(uri.path, json)
          json
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
