module Locations
  class EncodeService
    prepend BaseService

    option :city

    attr_reader :location

    def call
      find_location
    end

    private

    def find_location
      @location = ::Location.find(city: @city)

      return fail_t!(:not_found) if @location.blank?
    end

    def fail_t!(key)
      fail!(I18n.t(key, scope: 'services.errors.locations.encode_service'))
    end
  end
end
