defmodule Platform.AgilefitControllerTest do
  use Platform.ConnCase

  alias Platform.Agilefit
  @valid_attrs %{answer1: "some content", answer2: "some content", criterias: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, agilefit_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing criteria agile"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, agilefit_path(conn, :new)
    assert html_response(conn, 200) =~ "New agilefit"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, agilefit_path(conn, :create), agilefit: @valid_attrs
    assert redirected_to(conn) == agilefit_path(conn, :index)
    assert Repo.get_by(Agilefit, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, agilefit_path(conn, :create), agilefit: @invalid_attrs
    assert html_response(conn, 200) =~ "New agilefit"
  end

  test "shows chosen resource", %{conn: conn} do
    agilefit = Repo.insert! %Agilefit{}
    conn = get conn, agilefit_path(conn, :show, agilefit)
    assert html_response(conn, 200) =~ "Show agilefit"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, agilefit_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    agilefit = Repo.insert! %Agilefit{}
    conn = get conn, agilefit_path(conn, :edit, agilefit)
    assert html_response(conn, 200) =~ "Edit agilefit"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    agilefit = Repo.insert! %Agilefit{}
    conn = put conn, agilefit_path(conn, :update, agilefit), agilefit: @valid_attrs
    assert redirected_to(conn) == agilefit_path(conn, :show, agilefit)
    assert Repo.get_by(Agilefit, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    agilefit = Repo.insert! %Agilefit{}
    conn = put conn, agilefit_path(conn, :update, agilefit), agilefit: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit agilefit"
  end

  test "deletes chosen resource", %{conn: conn} do
    agilefit = Repo.insert! %Agilefit{}
    conn = delete conn, agilefit_path(conn, :delete, agilefit)
    assert redirected_to(conn) == agilefit_path(conn, :index)
    refute Repo.get(Agilefit, agilefit.id)
  end
end
