defmodule RealtimeTodos.Todos.Delete do
  alias RealtimeTodos.{Todo, Repo}

  def call(id) do
    Repo.delete(Todo, id)
  end
end
