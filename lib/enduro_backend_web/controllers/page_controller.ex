defmodule EnduroBackendWeb.PageController do
  use EnduroBackendWeb, :controller

  # def index(conn, _params) do
  #   conn
  #   |> put_resp_header("content-type", "text/html; charset=utf-8")
  #   |> Plug.Conn.send_file(200, "priv/enduro_site/index.html")
  #   |> halt()
  # end
  def index(conn, _params) do
    file = get_index_file(Application.get_env(:enduro_backend, :static_files))

    IO.inspect(file)
    {:ok, binary} = File.read(file)
    html(conn, binary)
  end

  defp get_index_file(nil),
    do: Path.join([:code.priv_dir(:enduro_backend), "static", "index.html"])

  defp get_index_file(static_files_path), do: Path.join(static_files_path, "index.html")
end
