defmodule GpxPhoenixWeb.Router do
  use GpxPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GpxPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "tracks", TracksController, :index
    get "tracks/:id", TracksController, :show
    get "tracks/:id/geojson", TracksController, :geojson
  end

  # Other scopes may use custom stacks.
  # scope "/api", GpxPhoenixWeb do
  #   pipe_through :api
  # end
end
