defmodule AuthMeWeb.PageController do
  use AuthMeWeb, :controller

  def index(conn, params) do
    IO.puts(Enum.map_join(params, ", ", fn {key, val} -> ~s{"#{key}"=> "#{val}"} end))
    render(conn, "index.html")
  end

  def protected(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "protected.html", current_user: user)
  end
end
