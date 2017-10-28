defmodule Platform.Router do
  use Platform.Web, :router

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

  scope "/", Platform do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/questions", QuestionnaireController
    resources "/criteria_agile", AgilefitController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Platform do
  #   pipe_through :api
  # end
end
