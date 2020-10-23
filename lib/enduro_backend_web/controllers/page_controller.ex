defmodule EnduroBackendWeb.PageController do
  use EnduroBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
