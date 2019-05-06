defmodule ChatWeb.ChatLive do
  use Phoenix.LiveView
  alias ChatWeb.ChatView
  alias Chat.Messages

  def mount(session, socket) do
    Messages.subscribe()
    new_socket = socket
    |> assign(name: session.name)

    {:ok, fetch(new_socket)}
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
    messages = Messages.list_messages()
    |> Enum.reverse()
    assign(socket, messages: messages)
  end
end
