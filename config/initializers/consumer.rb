channel = RabbitMq.consumer_channel
queue = channel.queue("geocoding", durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, _properties, payload|
  body = JSON(payload)

  result = Locations::EncodeService.call(city: body["city"])

  if result.success?
    client = AdsService::Rpc::Client.fetch
    client.geocode_coordinates(
      {
        lat: result.location.geo_lat,
        lon: result.location.geo_lon
      },
      body["post_id"]
    )
  end

  channel.ack(delivery_info.delivery_tag)
end