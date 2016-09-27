defmodule EventilAgenda.AgendaSession do
  use EventilAgenda.Web, :model
  import Ecto.Query
  
  schema "agenda_sessions" do
    field :name, :string
    field :started_at, Ecto.DateTime
    field :ended_at, Ecto.DateTime
    field :kind, :integer
    timestamps(inserted_at: :created_at)

    belongs_to :event, EventilAgenda.Event
  end

  def event_types(kind) do
    allFields = ['normal', 'organization', 'workshop', 'entertainment', 'lightning', 'keynote', 'party']
    Enum.at(allFields, kind)
  end

  def event_type(model) do
    event_types(model.kind)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :started_at, :ended_at, :kind, :event_id])
    |> validate_required([:name, :started_at, :ended_at, :kind, :event_id])
  end
end
