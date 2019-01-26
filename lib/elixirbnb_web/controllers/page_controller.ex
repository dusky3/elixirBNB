defmodule ElixirbnbWeb.PageController do
  use ElixirbnbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def home(conn, _params) do
    render(conn, "home.html")
  end
end
