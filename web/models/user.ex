defmodule Thinker.User do
  use Thinker.Web, :model
  use Ecto.Model

  schema "users" do
    field :username, :string
    timestamps
  end

  @required_fields ~w(username)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
