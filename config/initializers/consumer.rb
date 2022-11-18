channel = RabbitMq.consumer_channel
queue = channel.queue("geocoding", durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, _properties, payload|
  body = JSON(payload)

  result = Locations::EncodeService.call(city: body["city"])

  if result.success?
    client = AdsService::HTTP::Client.new
    client.geocode_coordinates(
      post_id: body["post_id"],
      lat: result.location.geo_lat.to_f,
      lon: result.location.geo_lon.to_f
    )
  end

  channel.ack(delivery_info.delivery_tag)
end