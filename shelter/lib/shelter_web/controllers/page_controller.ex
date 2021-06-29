defmodule ShelterWeb.PageController do
  use ShelterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
