module AdsService
  module Rpc
    module API
      def geocode_coordinates(geocodes, post_id)
        payload = { lat: geocodes[:lat], lon: geocodes[:lon], post_id: post_id }.to_json
        publish(payload, type: "geocodes")
      end
    end
  end
end