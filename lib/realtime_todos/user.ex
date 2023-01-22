defmodule RealtimeTodos.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    has_many :todos, RealtimeTodos.Todo
    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
