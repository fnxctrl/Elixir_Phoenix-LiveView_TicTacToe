defmodule Demo.Gameplay do
  @server Demo.Gameplay.Server
  def start_link(_) do
    GenServer.start_link(@server, nil, name: @server)
  end

  def get_state do
    GenServer.call(@server, :get_state)
  end

  def set_state(current_state) do
    GenServer.cast(@server, {:set_state, current_state})
  end
end
