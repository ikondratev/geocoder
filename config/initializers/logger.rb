Application.configure do |app|
  logger = Ougai::Logger.new(
    app.root.concat("/", Settings.logger.path),
    level: Settings.logger.level
  )

  logger.before_log = lambda do |data|
    data[:service] = { name: Settings.app.name }
  end

  app.set :logger, logger
end

Sequel::Model.db.loggers.push(Application.logger)