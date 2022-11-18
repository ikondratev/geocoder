require "dry/initializer"
require_relative "api"

module AdsService
  module HTTP
    class Client
      extend Dry::Initializer[undefined: false]
      include Api

      DEFAULT_URL = "http://localhost:9292".freeze

      option :connection, default: proc { build_connection }
      option :base_url, default: proc { Settings.ads.base_url || DEFAULT_URL }

      private

      def build_connection
        Faraday.new do |f|
          f.request :json
          f.response :json, content_type: /\bjson$/
          f.adapter(Faraday.default_adapter)
        end
      end
    end
  end
end
