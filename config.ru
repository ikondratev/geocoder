require_relative "config/environment"

use Rack::Ougai::LogRequests, Application.logger
use Rack::RequestId

map "/geocoder" do
  run GeoserviceRoutes
end