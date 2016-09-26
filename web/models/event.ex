defmodule EventilAgenda.Event do
  use EventilAgenda.Web, :model

  schema "events" do
    field :name, :string

    has_many :agenda_sessions, EventilAgenda.AgendaSession
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
