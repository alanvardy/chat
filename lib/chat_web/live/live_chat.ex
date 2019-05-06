defmodule ChatWeb.ChatLive do
  use Phoenix.LiveView
  alias ChatWeb.ChatView
  alias Chat.Messages

  def mount(_session, socket) do
    Messages.subscribe()

    {:ok, fetch(socket)}
  end

  def handle_info({Messages, [:message | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  def handle_event("add", %{"message" => message}, socket) do
    Messages.create_message(message)

    {:noreply, fetch(socket)}
  end

  def render(assigns) do
    ChatView.render("messages.html", assigns)
  end

  defp fetch(socket) do
    assign(socket, messages: Messages.list_messages())
  end
end
