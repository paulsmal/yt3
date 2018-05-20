defmodule Yt3WebWeb.Router do
  use Yt3WebWeb, :router

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

  scope "/", Yt3WebWeb do
    pipe_through :browser # Use the default browser stack

    #get "/", PageController, :index
    resources "/users", UserController
    resources "/playlists", PlaylistController
    resources "/", SourceController

  end

  # Other scopes may use custom stacks.
  # scope "/api", Yt3WebWeb do
  #   pipe_through :api
  # end
end
