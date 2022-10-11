class AuthRoutes < Application
  get "/ping" do
    "PONG"
  end

  namespace "/v1" do
    post "/" do
      valid_params = validate_with!(LocationParamsValidation)

      # result = Users::CreateService.call(
      #   name: valid_params[:name],
      #   email: valid_params[:email],
      #   password: valid_params[:password]
      # )

      if result.success?
        status 201
      else
        status 422
        error_response result.user
      end
    end
  end
end
