task :start_app do
  require "./test/fixtures/helloworld/app.rb"
  require "./test/fixtures/rackapp/app.rb"
  require "logger"

  logger = ::Logger.new(File.open("/dev/null", "w"))

  Thread.new do
    Rack::Handler::WEBrick.run(App.new,
      :Port => 9595,
      :Logger => logger,
      :AccessLog => []
    )
  end

  Thread.new do
    Rack::Handler::WEBrick.run($rackapp.to_app,
      :Port => 9696,
      :Logger => logger,
      :AccessLog => []
    )
  end

  # Let's simply wait for the sinatra app to start.
  sleep 2
end

task :test => :start_app do
  require "cutest"
  Cutest.run(Dir["test/*_test.rb"])
end

task :default => :test