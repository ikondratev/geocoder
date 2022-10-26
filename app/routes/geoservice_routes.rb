class GeoserviceRoutes < Application
  get "/ping" do
    "PONG"
  end

  namespace "/v1" do
    post "/" do
      valid_params = validate_with!(LocationParamsValidation)

      result = Locations::EncodeService.call(city: valid_params[:city])

      if result.success?
        status 200
        json meta: { encode: { lat: result.location.geo_lat, lon: result.location.geo_lon } }
      else
        status 422
        error_response result.errors
      end
    end
  end
end
