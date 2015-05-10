defmodule Thinker.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Thinker do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  socket "/ws", Thinker do
    channel "rooms:*", RoomChannel
  end

  # Other scopes may use custom stacks.
  # scope "/api", Thinker do
  #   pipe_through :api
  # end
end
