module AdsService
  module HTTP
    module Api
      UPDATE_ACTION = "update_coordinates".freeze
      # @param [Float] lat
      # @param [Float] lon
      # @param [Integer] post_id
      # @return [Hash] result
      def geocode_coordinates(lat:, lon:, post_id:)
        l "started", lat: lat, lon: lon, post_id: post_id
        @connection.post(
          "#{@base_url}/#{post_id}/#{UPDATE_ACTION}"
        ) do |request|
          request.body = {
            lat: lat,
            lon: lon
          }.to_json
        end
      rescue StandardError => e
        le "Error geocode_coordinates", e
      end
    end
  end
end
