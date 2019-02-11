defmodule WordsWeb.Router do
  use WordsWeb, :router

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

  scope "/", WordsWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/words", PageController, :words
  end

  # Other scopes may use custom stacks.
  # scope "/api", WordsWeb do
  #   pipe_through :api
  # end
end
