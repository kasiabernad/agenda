defmodule EventilAgenda.AgendaSessionController do
  use EventilAgenda.Web, :controller

  alias EventilAgenda.AgendaSession

  def index(conn, _params) do
    agenda_sessions = Repo.all(AgendaSession)
    render(conn, "index.html", agenda_sessions: agenda_sessions)
  end

  def new(conn, _params) do
    changeset = AgendaSession.changeset(%AgendaSession{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"agenda_session" => agenda_session_params}) do
    changeset = AgendaSession.changeset(%AgendaSession{}, agenda_session_params)

    case Repo.insert(changeset) do
      {:ok, _agenda_session} ->
        conn
        |> put_flash(:info, "Agenda session created successfully.")
        |> redirect(to: agenda_session_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    agenda_session = Repo.get!(AgendaSession, id)
    render(conn, "show.html", agenda_session: agenda_session)
  end

  def edit(conn, %{"id" => id}) do
    agenda_session = Repo.get!(AgendaSession, id)
    changeset = AgendaSession.changeset(agenda_session)
    render(conn, "edit.html", agenda_session: agenda_session, changeset: changeset)
  end

  def update(conn, %{"id" => id, "agenda_session" => agenda_session_params}) do
    agenda_session = Repo.get!(AgendaSession, id)
    changeset = AgendaSession.changeset(agenda_session, agenda_session_params)

    case Repo.update(changeset) do
      {:ok, agenda_session} ->
        conn
        |> put_flash(:info, "Agenda session updated successfully.")
        |> redirect(to: agenda_session_path(conn, :show, agenda_session))
      {:error, changeset} ->
        render(conn, "edit.html", agenda_session: agenda_session, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    agenda_session = Repo.get!(AgendaSession, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(agenda_session)

    conn
    |> put_flash(:info, "Agenda session deleted successfully.")
    |> redirect(to: agenda_session_path(conn, :index))
  end
end
