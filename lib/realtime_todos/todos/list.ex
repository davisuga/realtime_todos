defmodule RealtimeTodos.Todos.List do
  alias RealtimeTodos.{Todo, Repo}
  import Ecto.Query

  def all_from_user(uid) do
    Todo
    |> where(user_id: ^uid)
    |> Repo.all()
    |> Kernel.then(fn x -> {:ok, x} end)
  end

  def all() do
    Todo
    |> Repo.all()
  end
end
