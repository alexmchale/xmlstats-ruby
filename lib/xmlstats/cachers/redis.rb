module Xmlstats

  module Cachers

    class Redis

      def initialize(redis = nil)
        @redis =
          case redis
          when Hash  then ::Redis.new(redis)
          when Redis then redis
          when nil   then ::Redis.new
          else raise "unknown parameter type to redis cacher: #{redis.inspect}"
          end
      end

      def get(key)
        @redis.get(namespaced_key(key))
      end

      def set(key, value)
        @redis.setex(namespaced_key(key), 3600, value)
      end

      private

      def namespaced_key(key)
        "xmlstats:cache:#{key}"
      end

    end

  end

end
