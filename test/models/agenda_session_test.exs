defmodule EventilAgenda.AgendaSessionTest do
  use EventilAgenda.ModelCase

  alias EventilAgenda.AgendaSession

  @valid_attrs %{ended_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, event_id: 42, kind: 42, name: "some content", started_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, submission_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AgendaSession.changeset(%AgendaSession{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AgendaSession.changeset(%AgendaSession{}, @invalid_attrs)
    refute changeset.valid?
  end
end
