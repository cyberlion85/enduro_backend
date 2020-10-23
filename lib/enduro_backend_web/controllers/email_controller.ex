defmodule EnduroBackendWeb.EmailController do
  use EnduroBackendWeb, :controller

  alias EnduroBackend.Post
  # alias EnduroBackend.Post.Email

  action_fallback EnduroBackendWeb.FallbackController

  def index(conn, _params) do
    # emails = Post.list_emails()
    conn
    |> put_status(:created)
    |> json(%{successfully_uploaded: "good", upload_error: "bad"})
  end

  def create(conn, %{"email" => email_params}) do
    {:ok, text_body} = Map.fetch(email_params, "text_body")
    {:ok, description} = Map.fetch(email_params, "description")

    with :ok <- Post.create_email(text_body, description) do
      conn
      |> put_status(:created)
      |> json(%{text_body: text_body, description: description})
    end
  end

  # def show(conn, %{"id" => id}) do
  #   email = Post.get_email!(id)
  #   render(conn, "show.json", email: email)
  # end

  # def update(conn, %{"id" => id, "email" => email_params}) do
  #   email = Post.get_email!(id)

  #   with {:ok, %Email{} = email} <- Post.update_email(email, email_params) do
  #     render(conn, "show.json", email: email)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   email = Post.get_email!(id)

  #   with {:ok, %Email{}} <- Post.delete_email(email) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
