defmodule RealtimeTodos.Todos.Get do
  alias RealtimeTodos.{Todo, Repo}

  def call(id) do
    case Repo.get(Todo, id) do
      nil -> {:error, "Todo not found"}
      item -> {:ok, item}
    end
  end
end
