defmodule ElixirbnbWeb.Router do
  use ElixirbnbWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes(:protected)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirbnbWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", ElixirbnbWeb do
    pipe_through :protected

    # add protected resources below
    # resources "/privates", ElixirbnbWeb.PrivateController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirbnbWeb do
  #   pipe_through :api
  # end
end
