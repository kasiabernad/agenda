defmodule EventilAgenda.AgendaSessionControllerTest do
  use EventilAgenda.ConnCase

  alias EventilAgenda.AgendaSession
  @valid_attrs %{ended_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, event_id: 42, kind: 42, name: "some content", started_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, submission_id: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, agenda_session_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing agenda sessions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, agenda_session_path(conn, :new)
    assert html_response(conn, 200) =~ "New agenda session"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, agenda_session_path(conn, :create), agenda_session: @valid_attrs
    assert redirected_to(conn) == agenda_session_path(conn, :index)
    assert Repo.get_by(AgendaSession, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, agenda_session_path(conn, :create), agenda_session: @invalid_attrs
    assert html_response(conn, 200) =~ "New agenda session"
  end

  test "shows chosen resource", %{conn: conn} do
    agenda_session = Repo.insert! %AgendaSession{}
    conn = get conn, agenda_session_path(conn, :show, agenda_session)
    assert html_response(conn, 200) =~ "Show agenda session"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, agenda_session_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    agenda_session = Repo.insert! %AgendaSession{}
    conn = get conn, agenda_session_path(conn, :edit, agenda_session)
    assert html_response(conn, 200) =~ "Edit agenda session"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    agenda_session = Repo.insert! %AgendaSession{}
    conn = put conn, agenda_session_path(conn, :update, agenda_session), agenda_session: @valid_attrs
    assert redirected_to(conn) == agenda_session_path(conn, :show, agenda_session)
    assert Repo.get_by(AgendaSession, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    agenda_session = Repo.insert! %AgendaSession{}
    conn = put conn, agenda_session_path(conn, :update, agenda_session), agenda_session: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit agenda session"
  end

  test "deletes chosen resource", %{conn: conn} do
    agenda_session = Repo.insert! %AgendaSession{}
    conn = delete conn, agenda_session_path(conn, :delete, agenda_session)
    assert redirected_to(conn) == agenda_session_path(conn, :index)
    refute Repo.get(AgendaSession, agenda_session.id)
  end
end
