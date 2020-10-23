defmodule EnduroBackend.PostTest do
  use EnduroBackend.DataCase

  alias EnduroBackend.Post

  describe "emails" do
    alias EnduroBackend.Post.Email

    @valid_attrs %{adress: "some adress", body: "some body", description: "some description"}
    @update_attrs %{adress: "some updated adress", body: "some updated body", description: "some updated description"}
    @invalid_attrs %{adress: nil, body: nil, description: nil}

    def email_fixture(attrs \\ %{}) do
      {:ok, email} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Post.create_email()

      email
    end

    test "list_emails/0 returns all emails" do
      email = email_fixture()
      assert Post.list_emails() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Post.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      assert {:ok, %Email{} = email} = Post.create_email(@valid_attrs)
      assert email.adress == "some adress"
      assert email.body == "some body"
      assert email.description == "some description"
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Post.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()
      assert {:ok, %Email{} = email} = Post.update_email(email, @update_attrs)
      assert email.adress == "some updated adress"
      assert email.body == "some updated body"
      assert email.description == "some updated description"
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Post.update_email(email, @invalid_attrs)
      assert email == Post.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Post.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Post.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Post.change_email(email)
    end
  end
end
