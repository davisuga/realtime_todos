defmodule RealtimeTodosWeb.Resolvers.Todo do
  alias RealtimeTodos.Todos.{List, Create}

  def list_by_user(%{uid: user_id}, _context),
    do: List.all_from_user(user_id)

  def create(%{input: attributes}, _context),
    do: Create.call(attributes)
end
