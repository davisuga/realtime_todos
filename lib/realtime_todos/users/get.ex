defmodule RealtimeTodos.Users.Get do
  alias RealtimeTodos.{User, Repo}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      item -> {:ok, item}
    end
  end

  def by_name(name) do
    case Repo.get_by(User, name: name) do
      nil -> {:error, "User not found"}
      item -> {:ok, item}
    end
  end
end
