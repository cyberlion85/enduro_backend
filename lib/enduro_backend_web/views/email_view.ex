defmodule EnduroBackendWeb.EmailView do
  use EnduroBackendWeb, :view
  alias EnduroBackendWeb.EmailView

  def render("index.json", %{emails: emails}) do
    %{data: render_many(emails, EmailView, "email.json")}
  end

  def render("show.json", %{email: email}) do
    %{data: render_one(email, EmailView, "email.json")}
  end

  def render("email.json", %{email: email}) do
    %{id: email.id,
      adress: email.adress,
      description: email.description,
      body: email.body}
  end
end
