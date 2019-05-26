defmodule Demo.Stateofplay do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def init do
    Agent.update(__MODULE__, & &1)
  end

  def initialise_state() do
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
