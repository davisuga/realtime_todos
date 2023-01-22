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

  object :root_subscription do
    field :my_todos, :todo do
      arg :uid, non_null(:string)

      config fn args, _ ->
        {:ok, topic: args.user_id}
      end

      trigger :create_todo, topic: &Function.identity/1

      resolve fn todo, _, _ ->
        # this function is often not actually necessary, as the default resolver
        # for subscription functions will just do what we're doing here.
        # The point is, subscription resolvers receive whatever value triggers
        # the subscription, in our case a todo.
        {:ok, todo}
      end
    end
  end
end
