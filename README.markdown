Pistol
======

_n. A small tool designed to reload your rack application._

Get it!
-------

    $ gem install pistol

Usage
-----

    # app.rb
    require "sinatra/base"
    require "pistol"

    class App < Sinatra::Base
      use Pistol, Dir[__FILE__, "./app/**/*.rb"] do
        reset! and load(__FILE__)
      end
    end

    Dir["./app/**/*.rb"].each { |file| require file }

### What this does:

1. It instructs Pistol to watch for changes in any of the files passed.
2. If changes occur, the block is executed.

### Only in development?

Sure. Simply change it to:

    class App < Sinatra::Base
      configure :development do
        use Pistol, Dir[__FILE__, "./app/**/*.rb"] do
          reset! and load(__FILE__)
        end
      end
    end