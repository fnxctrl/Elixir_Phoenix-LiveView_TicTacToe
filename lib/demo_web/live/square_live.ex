defmodule DemoWeb.SquareLive do
  use Phoenix.LiveView
  @user_mark "O"

  def render(assigns) do
    ~L"""
    <h1>Tic Tac Toe</h1>
    <div>
       <table class="fixed">
    <col width="150px" />
    <col width="150px" />
    <col width="150px" />
      <tr height="150px">
        <td phx-click="spot_0"><%= Enum.at(@state.board, 0) %></td>
        <td phx-click="spot_1"><%= Enum.at(@state.board, 1) %></td>
        <td phx-click="spot_2"><%= Enum.at(@state.board, 2) %></td>
      </tr>
      <tr height="150px">
        <td phx-click="spot_3"><%= Enum.at(@state.board, 3) %></td>
        <td phx-click="spot_4"><%= Enum.at(@state.board, 4) %></td>
        <td phx-click="spot_5"><%= Enum.at(@state.board, 5) %></td>
      </tr>
      <tr height="150px">
        <td phx-click="spot_6"><%= Enum.at(@state.board, 6) %></td>
        <td phx-click="spot_7"><%= Enum.at(@state.board, 7) %></td>
        <td phx-click="spot_8"><%= Enum.at(@state.board, 8) %></td>
      </tr>
      </table>
    </div>
    <h2>Message: <%= @state.outcome %></h2>
    """
  end

  def initial_state() do
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

  def mount(_session, socket) do
    # ==========================================================
    Demo.Sequence.start_link(42)
    IO.puts(Demo.Sequence.next_number())
    IO.puts(Demo.Sequence.next_number())
    # ==========================================================

    # ==========================================================
    Demo.Gameplay.start_link(initial_state())
    IO.puts(inspect(Demo.Gameplay.get_state()))
    # IO.puts(Demo.Sequence.next_number())
    # ==========================================================

    IO.puts("Initial mount")
    the_state = initial_state()

    {:ok,
     assign(socket,
       message: "Click in a square to begin",
       state: the_state
     )}
  end

  # ===============  0..2 ===============

  def handle_event("spot_0", _path, socket) do
    # ===============  0. ===============

    IO.puts("Human plays spot_0")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 0)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  def handle_event("spot_1", _path, socket) do
    # ===============  1. ===============

    IO.puts("Human plays spot_1")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 1)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  def handle_event("spot_2", _path, socket) do
    # ===============  2. ===============

    IO.puts("Human plays spot_2")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 2)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  # ===============  3..5 ===============
  def handle_event("spot_3", _path, socket) do
    # ===============  3. ===============

    IO.puts("Human plays spot_3")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 3)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  def handle_event("spot_4", _path, socket) do
    # ===============  4. ===============

    IO.puts("Human plays spot_4")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 4)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  def handle_event("spot_5", _path, socket) do
    # ===============  5. ===============

    IO.puts("Human plays spot_5")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 5)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  # ===============  6..8 ===============

  def handle_event("spot_6", _path, socket) do
    # ===============  6. ===============

    IO.puts("Human plays spot_6")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 6)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  def handle_event("spot_7", _path, socket) do
    # ===============  7. ===============

    IO.puts("Human plays spot_7")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 7)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end

  def handle_event("spot_8", _path, socket) do
    # ===============  8. ===============

    IO.puts("Human plays spot_8")
    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), 8)
    Demo.Gameplay.set_state(new_state)

    comp_spot = Demo.Minimax.get_comp_move(new_state)

    new_state = Demo.State.update_state(Demo.Gameplay.get_state(), comp_spot)
    IO.puts("Computer plays spot #{comp_spot}")
    Demo.Gameplay.set_state(new_state)
    # IO.puts(inspect(Demo.Gameplay.get_state()))
    # ===================================

    {:noreply, assign(socket, state: new_state)}
  end
end
