module Api
  class LocationParamsValidation < Dry::Validation::Contract
    params do
      required(:city).filled(:string)
    end
  end
end
