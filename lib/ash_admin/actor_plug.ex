defmodule AshAdmin.ActorPlug do
  @moduledoc false

  @behaviour Plug

  @plug Application.compile_env(:ash_admin, :actor_plug, AshAdmin.ActorPlug.Plug)

  @callback set_actor_session(conn :: Plug.Conn.t()) :: Plug.Conn.t()
  @callback actor_assigns(socket :: Phoenix.LiveView.Socket.t(), session :: map) :: Keyword.t()

  def init(opts), do: opts

  def call(conn, _opts) do
    set_actor_session(conn)
  end

  def actor_assigns(socket, session) do
    @plug.actor_assigns(socket, session)
  end

  def set_actor_session(conn) do
    @plug.set_actor_session(conn)
  end
end
