defmodule Platform.QuestionnaireControllerTest do
  use Platform.ConnCase

  alias Platform.Questionnaire
  @valid_attrs %{answer1: "some content", answer2: "some content", questions: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, questionnaire_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing question list"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, questionnaire_path(conn, :new)
    assert html_response(conn, 200) =~ "New questionnaire"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, questionnaire_path(conn, :create), questionnaire: @valid_attrs
    assert redirected_to(conn) == questionnaire_path(conn, :index)
    assert Repo.get_by(Questionnaire, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, questionnaire_path(conn, :create), questionnaire: @invalid_attrs
    assert html_response(conn, 200) =~ "New questionnaire"
  end

  test "shows chosen resource", %{conn: conn} do
    questionnaire = Repo.insert! %Questionnaire{}
    conn = get conn, questionnaire_path(conn, :show, questionnaire)
    assert html_response(conn, 200) =~ "Show questionnaire"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, questionnaire_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    questionnaire = Repo.insert! %Questionnaire{}
    conn = get conn, questionnaire_path(conn, :edit, questionnaire)
    assert html_response(conn, 200) =~ "Edit questionnaire"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    questionnaire = Repo.insert! %Questionnaire{}
    conn = put conn, questionnaire_path(conn, :update, questionnaire), questionnaire: @valid_attrs
    assert redirected_to(conn) == questionnaire_path(conn, :show, questionnaire)
    assert Repo.get_by(Questionnaire, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    questionnaire = Repo.insert! %Questionnaire{}
    conn = put conn, questionnaire_path(conn, :update, questionnaire), questionnaire: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit questionnaire"
  end

  test "deletes chosen resource", %{conn: conn} do
    questionnaire = Repo.insert! %Questionnaire{}
    conn = delete conn, questionnaire_path(conn, :delete, questionnaire)
    assert redirected_to(conn) == questionnaire_path(conn, :index)
    refute Repo.get(Questionnaire, questionnaire.id)
  end
end
