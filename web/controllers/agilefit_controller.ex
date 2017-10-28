defmodule Platform.AgilefitController do
  use Platform.Web, :controller

  alias Platform.Agilefit

  def index(conn, _params) do
    criteria_agile = Repo.all(Agilefit)
    render(conn, "index.html", criteria_agile: criteria_agile)
  end

  def new(conn, _params) do
    changeset = Agilefit.changeset(%Agilefit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"agilefit" => agilefit_params}) do
    changeset = Agilefit.changeset(%Agilefit{}, agilefit_params)

    case Repo.insert(changeset) do
      {:ok, _agilefit} ->
        conn
        |> put_flash(:info, "Agilefit created successfully.")
        |> redirect(to: agilefit_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    agilefit = Repo.get!(Agilefit, id)
    render(conn, "show.html", agilefit: agilefit)
  end

  def edit(conn, %{"id" => id}) do
    agilefit = Repo.get!(Agilefit, id)
    changeset = Agilefit.changeset(agilefit)
    render(conn, "edit.html", agilefit: agilefit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "agilefit" => agilefit_params}) do
    agilefit = Repo.get!(Agilefit, id)
    changeset = Agilefit.changeset(agilefit, agilefit_params)

    case Repo.update(changeset) do
      {:ok, agilefit} ->
        conn
        |> put_flash(:info, "Agilefit updated successfully.")
        |> redirect(to: agilefit_path(conn, :show, agilefit))
      {:error, changeset} ->
        render(conn, "edit.html", agilefit: agilefit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    agilefit = Repo.get!(Agilefit, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(agilefit)

    conn
    |> put_flash(:info, "Agilefit deleted successfully.")
    |> redirect(to: agilefit_path(conn, :index))
  end
end
