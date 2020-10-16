defmodule <%= inspect context.web_module %>.ModalComponent do
  use <%= inspect context.web_module %>, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div id="<%%= @id %>" class="phx-modal modal fade"
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target="#<%%= @id %>"
      phx-page-loading
      phx-hook="Modal">

      <%= live_component @socket, @component, @opts %>
    </div>
    """
  end

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
