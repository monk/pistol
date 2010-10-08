require "cutest"
require "open-uri"
require "fileutils"

TEST_SERVER = "http://localhost:9595"

module Kernel
private
  def get(path)
    open([TEST_SERVER, path].join).read
  end

  def app_root(*args)
    File.join(File.dirname(__FILE__), "fixtures", "helloworld", *args)
  end

  def modify(file, old, new)
    path = app_root(file)
    prev = File.read(path)
    change(path, prev.gsub(old, new))
    sleep 1
    FileUtils.touch(path)
    yield
  ensure
    change(app_root(file), prev)
  end

  def change(file, data)
    File.open(file, "w") { |f| f.write data }
  end
end
