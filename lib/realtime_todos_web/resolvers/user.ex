defmodule RealtimeTodosWeb.Resolvers.User do
  alias RealtimeTodos.Users.{Create, Get}

  def create(%{input: attributes}, _context),
    do: Create.call(attributes)

  def get_by_name(%{name: username}, _context),
    do: Get.by_name(username)
end
