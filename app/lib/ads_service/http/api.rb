module AdsService
  module HTTP
    module Api
      UPDATE_ACTION = "update_coordinates".freeze
      # @param [Float] lat
      # @param [Float] lon
      # @param [Integer] post_id
      # @return [Hash] result
      def geocode_coordinates(lat:, lon:, post_id:)
        @connection.post(
          "#{@base_url}/#{post_id}/#{UPDATE_ACTION}"
        ) do |request|
          request.body = {
            lat: lat,
            lon: lon
          }.to_json
        end
      rescue StandardError => e
        puts "[API::GEOCODE_LOCATION] error: #{e.message}"
      end
    end
  end
end
