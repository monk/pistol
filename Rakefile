task :start_app do
  require "./test/fixtures/helloworld/app.rb"
  require "./test/fixtures/rackapp/app.rb"
  require "logger"

  Thread.new do
    Rack::Handler::WEBrick.run(App.new,
      :Port => 9595,
      :Logger => ::Logger.new(File.open("/dev/null", "w")),
      :AccessLog => []
    )
  end

  Thread.new do
    Rack::Handler::WEBrick.run(RackApp.to_app,
      :Port => 9696,
      :Logger => ::Logger.new(File.open("/dev/null", "w")),
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
