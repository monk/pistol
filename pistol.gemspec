Gem::Specification.new do |s|
  s.name = "pistol"
  s.version = "0.0.2"
  s.summary = %{The light tool for the reloading job.}
  s.description = %Q{Extremely lightweight reloading tool for rack &
                     sinatra apps.}
  s.authors = ["Michel Martens", "Damian Janowski", "Cyril David"]
  s.email = ["michel@soveran.com", "djanowski@dimaion.com",
             "cyx@pipetodevnull.com"]
  s.homepage = "http://github.com/monk/pistol"
  s.files = ["lib/pistol.rb", "README.markdown", "LICENSE", "Rakefile", "test/cuba_test.rb", "test/fixtures/cuba/app/article.rb", "test/fixtures/cuba/app.rb", "test/fixtures/cuba/lib/article.rb", "test/fixtures/cuba/lib/book.rb", "test/fixtures/rackapp/app/article.rb", "test/fixtures/rackapp/app.rb", "test/fixtures/rackapp/lib/book.rb", "test/fixtures/sinatra/app/article.rb", "test/fixtures/sinatra/app.rb", "test/fixtures/sinatra/lib/article.rb", "test/fixtures/sinatra/lib/book.rb", "test/helper.rb", "test/rack_app_test.rb", "test/sinatra_test.rb"]

  s.rubyforge_project = "pistol"
  s.add_development_dependency "cutest", "~> 1.0"
  s.add_development_dependency "rack", "~> 1.0"
  s.add_development_dependency "sinatra", "~> 1.0"
  s.add_development_dependency "cuba", "~> 1.0"
end
