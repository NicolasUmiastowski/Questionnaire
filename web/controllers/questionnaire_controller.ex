defmodule Platform.QuestionnaireController do
  use Platform.Web, :controller

  alias Platform.Questionnaire

  def index(conn, _params) do
    question_list = Repo.all(Questionnaire)
    render(conn, "index.html", question_list: question_list)
  end

  def new(conn, _params) do
    changeset = Questionnaire.changeset(%Questionnaire{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"questionnaire" => questionnaire_params}) do
    changeset = Questionnaire.changeset(%Questionnaire{}, questionnaire_params)

    case Repo.insert(changeset) do
      {:ok, _questionnaire} ->
        conn
        |> put_flash(:info, "Questionnaire created successfully.")
        |> redirect(to: questionnaire_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    questionnaire = Repo.get!(Questionnaire, id)
    render(conn, "show.html", questionnaire: questionnaire)
  end

  def edit(conn, %{"id" => id}) do
    questionnaire = Repo.get!(Questionnaire, id)
    changeset = Questionnaire.changeset(questionnaire)
    render(conn, "edit.html", questionnaire: questionnaire, changeset: changeset)
  end

  def update(conn, %{"id" => id, "questionnaire" => questionnaire_params}) do
    questionnaire = Repo.get!(Questionnaire, id)
    changeset = Questionnaire.changeset(questionnaire, questionnaire_params)

    case Repo.update(changeset) do
      {:ok, questionnaire} ->
        conn
        |> put_flash(:info, "Questionnaire updated successfully.")
        |> redirect(to: questionnaire_path(conn, :show, questionnaire))
      {:error, changeset} ->
        render(conn, "edit.html", questionnaire: questionnaire, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    questionnaire = Repo.get!(Questionnaire, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(questionnaire)

    conn
    |> put_flash(:info, "Questionnaire deleted successfully.")
    |> redirect(to: questionnaire_path(conn, :index))
  end
end
