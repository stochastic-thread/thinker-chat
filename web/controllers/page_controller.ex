defmodule Thinker.PageController do
  use Thinker.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
