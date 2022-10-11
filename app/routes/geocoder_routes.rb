class AuthRoutes < Application
  get "/ping" do
    "PONG"
  end

  namespace "/v1" do
    post "/" do
      valid_params = validate_with!(LocationParamsValidation)

      result = Goecoder::EncodeService.call(city: valid_params[:city])

      if result.success?
        status 200
        json meta: { encode: [result.location.lat, result.location.lon] }
      else
        status 422
        error_response result.user
      end
    end
  end
end
