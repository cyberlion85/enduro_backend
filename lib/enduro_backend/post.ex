defmodule EnduroBackend.Post do
  # import Ecto.Query, warn: false
  # alias EnduroBackend.Repo

  # alias EnduroBackend.Post.Email

  def list_emails do
    raise "TODO"
  end

  def create_email(text_body, description) do
    # text_body = "bla bla bla"
    # description = "about"
    params = "echo #{text_body} | mail -s #{description} s.persanov@gmail.com"
    params |> String.to_charlist() |> :os.cmd()
    # IO.puts('email')
  end
end

# iex(14)> "echo #{text} | mail -s Disk usage s.persanov@gmail.com"

# iex(15)> body="echo #{text} | mail -s Disk usage s.persanov@gmail.com"

# iex(16)> body |> String.to_charlist |> :os.cmd
