defmodule RealtimeTodos.Users.Create do
  alias RealtimeTodos.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
