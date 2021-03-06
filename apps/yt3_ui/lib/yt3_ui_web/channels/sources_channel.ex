defmodule Yt3UiWeb.SourcesChannel do
  use Yt3UiWeb, :channel

  def join("sources:ready", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (sources:lobby).
  def handle_in("url", %{"url" => url}, socket) do
    YT3.proceed_source(url, 1)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
