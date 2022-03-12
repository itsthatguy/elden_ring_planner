defmodule EldenRingPlannerWeb.PageController do
  use EldenRingPlannerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
