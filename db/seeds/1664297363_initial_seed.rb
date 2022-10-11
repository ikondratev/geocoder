Sequel.seed do
  def run
    Location.create \
      lat: "12.12323",
      lon: "12.12323",
      city: "Paris"
  end
end