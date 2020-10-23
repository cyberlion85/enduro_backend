defmodule EnduroBackendWeb.EmailController do
  use EnduroBackendWeb, :controller

  # alias EnduroBackend.Post
  # alias EnduroBackend.Post.Email

  action_fallback EnduroBackendWeb.FallbackController

  def index(conn, _params) do
    # emails = Post.list_emails()
    conn
    |> put_status(:created)
    |> json(%{successfully_uploaded: "good", upload_error: "bad"})
  end

  def create(conn, %{"email" => email_params}) do
      # emails = Post.list_emails()
      # with {:ok, %Email{} = email} <- Post.create_email(email_params) do
      conn
      |> put_status(:created)
      |> json(%{email_sent: "good"})
      # end
    # with {:ok, %Email{} = email} <- Post.create_email(email_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.email_path(conn, :show, email))
    #   |> render("show.json", email: email)
    # end
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
