require File.expand_path("./helper", File.dirname(__FILE__))

scope do
  def app_name
    "sinatra"
  end

  setup do
    "http://localhost:9595"
  end

  test "/hello" do |server|
    assert "Hello" == get(server, "/hello")
  end

  test "/hello when modified" do |server|
    modify("app.rb", %{"Hello"}, %{"New Hello"}) do
      assert "New Hello" == get(server, "/hello")
    end
  end

  test "/article changes when Article is changed" do |server|
    assert "Hello World v1" == get(server, "/article")

    modify("app/article.rb", %{"Hello World v1"}, %{"Hello World v2"}) do
      assert "Hello World v2" == get(server, "/article")
    end
  end

  test "/book doesn't change since Book is in lib" do |server|
    assert "Sinatra Book" == get(server, "/book")

    modify("lib/book.rb", %{"Sinatra Book"}, %{"Rack Book"}) do
     assert "Sinatra Book" == get(server, "/book")
    end
  end
end
