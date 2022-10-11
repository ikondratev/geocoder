require_relative "config/environment"

use Rack::PostBodyContentTypeParser

map "/geocoder" do
  run AuthRoutes
end