defmodule RealtimeTodos.Todos.Create do
  alias RealtimeTodos.{Todo, Repo}

  def call(params) do
    params
    |> Todo.changeset()
    |> Repo.insert()
  end
end
