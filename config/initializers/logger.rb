require "log_formatter"

include LogFormatter

Application.configure do |app|
  logger = AppLogger.new(mode: ENV["RACK_ENV"]).instance
  app.set :logger, logger
end

Sequel::Model.db.loggers.push(Application.logger)
initialize_formatter! Application.logger