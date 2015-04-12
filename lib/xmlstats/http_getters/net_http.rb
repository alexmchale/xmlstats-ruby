module Xmlstats

  module HttpGetters

    class NetHttp

      def get(uri)
        http                     = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl             = true
        http.verify_mode         = OpenSSL::SSL::VERIFY_PEER
        headers                  = {}
        api_key                  = Xmlstats.api_key
        headers["User-Agent"]    = "xmlstats-ruby/#{Xmlstats::VERSION} (#{Xmlstats.contact_info})"
        headers["Authorization"] = "Bearer #{api_key}" if api_key
        request                  = Net::HTTP::Get.new(uri.request_uri, headers)
        response                 = http.request(request)

        Xmlstats.limit_total      = Integer(response.header["xmlstats-api-limit"])
        Xmlstats.limit_remaining  = Integer(response.header["xmlstats-api-remaining"])
        Xmlstats.limit_reset_time = Time.at(Integer(response.header["xmlstats-api-reset"]))

        if response.kind_of? Net::HTTPOK
          response.body
        else
          message        = "api request returned #{response.code}"
          error          = Error.new(message)
          error.request  = request
          error.response = response
          puts response.body
          raise error
        end
      end

      class Error < RuntimeError
        attr_accessor :request, :response
      end

    end

  end

end
