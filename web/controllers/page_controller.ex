defmodule Platform.PageController do
  use Platform.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
