defmodule EnduroBackendWeb.EmailController do
  use EnduroBackendWeb, :controller

  alias EnduroBackend.Post

  action_fallback EnduroBackendWeb.FallbackController

  def index(conn, _params) do
    # emails = Post.list_emails()
    conn
    |> put_status(:created)
    |> json(%{successfully_uploaded: "good", upload_error: "bad"})
  end

  def create(conn, %{"email" => email_params}) do
    IO.inspect(email_params)
    {:ok, text_body} = Map.fetch(email_params, "text_body")
    {:ok, description} = Map.fetch(email_params, "description")

    with :ok <- Post.create_email(text_body, description) do
      conn
      |> put_status(:created)
      |> json(%{text_body: text_body, description: description})
    end
  end


end
