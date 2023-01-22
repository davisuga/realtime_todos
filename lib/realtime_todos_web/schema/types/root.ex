defmodule RealtimeTodosWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation
  alias RealtimeTodosWeb.Resolvers

  import_types RealtimeTodosWeb.Schema.Types.{Todo, User}

  object :root_query do
    field :todos, type: list_of(:todo) do
      arg :uid, non_null(:id)

      resolve &Resolvers.Todo.list_by_user/2
    end

    field :myself, type: :user do
      arg :name, non_null(:string)

      resolve &Resolvers.User.get_by_name/2
    end
  end

  object :root_mutation do
    field :create_todo, type: :todo do
      arg :input, non_null(:input_todo)
      resolve &Resolvers.Todo.create/2
    end

    field :create_user, type: :user do
      arg :input, non_null(:input_user)

      resolve &Resolvers.User.create/2
    end
  end
end
