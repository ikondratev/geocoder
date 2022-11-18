require_relative "api"

module AdsService
  module Rpc
    class Client
      extend Dry::Initializer[undefined: false]
      include API

      option :queue, default: proc { create_queue }
      option :reply_queue, default: proc { create_reply_queue }
      option :lock, default: proc { Mutex.new }
      option :condition, default: proc { ConditionVariable.new }

      ADS_QUEUE_CHANNEL = "ads".freeze
      REPLY_QUEUE_CHANNEL = "ads_reply".freeze

      def self.fetch
        Thread.current["ads_service.rpc.client"] ||= new.start
      end

      def start
        @reply_queue.subscribe do |_info, properties, _payload|
          if properties.correlation_id == @correlation_id
            @lock.synchronize { @condition.signal }
          end
        end

        self
      end

      private

      attr_writer :correlation_id

      def create_queue
        RabbitMq.channel.queue("ads", durable: true)
      end

      def create_reply_queue
        RabbitMq.channel.queue("ads_reply")
      end

      def publish(payload, **opts)
        @lock.synchronize do
          self.correlation_id = SecureRandom.uuid

          @queue.publish(
            payload,
            opts.merge(
              app_id: "geocoder",
              reply_to: @reply_queue.name,
              correlation_id: @correlation_id
            )
          )

          @condition.wait(@lock)
        end
      end
    end
  end
end
