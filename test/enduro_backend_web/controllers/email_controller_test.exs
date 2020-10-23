defmodule EnduroBackendWeb.EmailControllerTest do
  use EnduroBackendWeb.ConnCase

  alias EnduroBackend.Post
  alias EnduroBackend.Post.Email

  @create_attrs %{
    adress: "some adress",
    body: "some body",
    description: "some description"
  }
  @update_attrs %{
    adress: "some updated adress",
    body: "some updated body",
    description: "some updated description"
  }
  @invalid_attrs %{adress: nil, body: nil, description: nil}

  def fixture(:email) do
    {:ok, email} = Post.create_email(@create_attrs)
    email
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all emails", %{conn: conn} do
      conn = get(conn, Routes.email_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create email" do
    test "renders email when data is valid", %{conn: conn} do
      conn = post(conn, Routes.email_path(conn, :create), email: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.email_path(conn, :show, id))

      assert %{
               "id" => id,
               "adress" => "some adress",
               "body" => "some body",
               "description" => "some description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.email_path(conn, :create), email: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update email" do
    setup [:create_email]

    test "renders email when data is valid", %{conn: conn, email: %Email{id: id} = email} do
      conn = put(conn, Routes.email_path(conn, :update, email), email: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.email_path(conn, :show, id))

      assert %{
               "id" => id,
               "adress" => "some updated adress",
               "body" => "some updated body",
               "description" => "some updated description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, email: email} do
      conn = put(conn, Routes.email_path(conn, :update, email), email: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete email" do
    setup [:create_email]

    test "deletes chosen email", %{conn: conn, email: email} do
      conn = delete(conn, Routes.email_path(conn, :delete, email))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.email_path(conn, :show, email))
      end
    end
  end

  defp create_email(_) do
    email = fixture(:email)
    %{email: email}
  end
end
