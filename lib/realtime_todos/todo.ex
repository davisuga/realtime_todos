defmodule RealtimeTodos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :done, :boolean, default: false
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:name, :description, :done])
    |> validate_required([:name, :description, :done])
  end
end
