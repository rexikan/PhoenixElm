defmodule ElmBase.CounterChannel do
  use ElmBase.Web, :channel

  def join("counters:counter", payload, socket) do
    if authorized?(payload) do
      send self(), :after_join
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_info(:after_join, socket) do
    socket = assign(socket, :counter, 0)
    push socket, "set_model", %{ model: socket.assigns[:counter] }
    {:noreply, socket}
  end

  def handle_in("send_action", payload, socket) do
    socket = case payload do
      %{ "action" => "Inc" } -> assign(socket, :counter, socket.assigns[:counter] + 1)
      %{ "action" => "Dec" } -> assign(socket, :counter, socket.assigns[:counter] - 1)
      _ -> socket
    end
    push socket, "set_model", %{ model: socket.assigns[:counter] }
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
