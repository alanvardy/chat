defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  alias Chat.Messages
  alias Chat.Messages.Message

  def chat(conn, _params) do
    changeset = Messages.change_message(%Message{})
    render(conn, "chat.html", changeset: changeset, name: "TEST")
  end
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
