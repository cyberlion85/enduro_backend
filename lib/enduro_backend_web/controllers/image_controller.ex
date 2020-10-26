defmodule EnduroBackendWeb.ImageController do
  use EnduroBackendWeb, :controller

  def local_file_path_from_hame(name) do
    Path.join(Path.absname("images"), name)
  end

  def showImage(conn, %{"id" => name}) do
    IO.inspect(conn)
    local_path = local_file_path_from_hame(name)

    file = File.read!(local_path)

    conn
    |> put_resp_content_type("image/jpg")
    |> put_resp_header("content-disposition", ~s(inline))
    |> send_resp(200, file)

    # else
    #   {:error, _reason} ->
    #     conn
    #     |> send_resp(404, "Not found")
  end
end
