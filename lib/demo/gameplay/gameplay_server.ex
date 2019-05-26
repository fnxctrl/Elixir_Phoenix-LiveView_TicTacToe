defmodule Demo.Gameplay.Server do
  use GenServer
  alias Demo.Gameplay.Impl

  def init(_) do
    {:ok, initialise_state()}
  end

  def handle_call(:get_state, _from, current_state) do
    {:reply, current_state, Impl.get(current_state)}
  end

  def handle_cast({:set_state, new_state}, current_state) do
    {:noreply, Impl.set(new_state)}
  end

  defp initialise_state() do
    players_team = :x
    comp_team = :o

    init = %Demo.State{
      board: Enum.to_list(0..8),
      outcome: :ongoing,
      turn: :player,
      player: players_team,
      comp: comp_team,
      available_moves: Enum.to_list(0..8)
    }
  end
end
