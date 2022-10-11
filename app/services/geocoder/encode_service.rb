module Geocoder
  class Encode
    prepend BaseService

    option :city

    attr_reader :location

    def call
      find_location
    end

    private

    def find_location
      @location = ::Location.find(city: @city)

      return fail_t!(:not_found) unless @location
    end

    def fail_t!(key)
      fail!(I18n.t(key, scope: 'services.error.location'))
    end
  end
end