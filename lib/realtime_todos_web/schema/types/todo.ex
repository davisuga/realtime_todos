defmodule RealtimeTodosWeb.Schema.Types.Todo do
  use Absinthe.Schema.Notation

  object :todo do
    field :id, non_null(:id)
    field :done, non_null(:boolean)
    field :name, non_null(:string)
    field :description, non_null(:string)

    field :user_id, non_null(:id)
  end

  input_object :input_todo do
    field :done, :boolean
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :user_id, non_null(:id)
  end
end
