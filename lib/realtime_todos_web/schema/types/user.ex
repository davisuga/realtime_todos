defmodule RealtimeTodosWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  input_object :input_user do
    field :name, non_null(:string)
  end
end
