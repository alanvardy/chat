defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  alias Chat.Messages
  alias Chat.Messages.Message

  def chat(conn, %{"user" => %{"name" => name}}) do
    changeset = Messages.change_message(%Message{})
    render(conn, "chat.html", changeset: changeset, name: name)
  end
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def erase(conn, _params) do
    Messages.delete_all()

    conn
    |> put_flash(:info, "Deleted all messages.")
    |> render("index.html")
  end
end
