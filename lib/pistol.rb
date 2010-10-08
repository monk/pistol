class Pistol
  VERSION = "0.0.1"

  attr :options

  def initialize(app, options = {})
    @options  = optimize_options(options)
    @app      = app
    @app_file = options[:files].first
    @last     = last_mtime
  end

  def call(env)
    current = last_mtime

    if current >= @last
      if Thread.list.size > 1
        Thread.exclusive { reload! }
      else
        reload!
      end

      @last = current
    end

    @app.call(env)
  end

private
  def reload!
    options[:files].each { |file| $LOADED_FEATURES.delete(file) }

    @app.class.reset! if @app.class.respond_to?(:reset!)
    require @app_file
  end

  def last_mtime
    options[:files].map { |file| ::File.mtime(file) }.max
  end

  def optimize_options(options)
    opts = options.dup
    opts[:files] ||= Dir["./app/**/*.rb"]
    opts[:files].map! { |file| File.expand_path(file) }
    opts
  end
end