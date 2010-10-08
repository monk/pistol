task :start_app do
  require "./test/fixtures/helloworld/app.rb"
  require "logger"

  Thread.new do
    Rack::Handler::WEBrick.run(App.new,
      :Port => 9595,
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