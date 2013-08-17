module Xmlstats

  module Cachers

    class Memory

      def get(key)
        @cache ||= {}
        @cache[key]
      end

      def set(key, value)
        @cache ||= {}
        @cache[key] = value
      end

    end

  end

end
