defmodule Platform.AgilefitTest do
  use Platform.ModelCase

  alias Platform.Agilefit

  @valid_attrs %{answer1: "some content", answer2: "some content", criterias: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Agilefit.changeset(%Agilefit{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Agilefit.changeset(%Agilefit{}, @invalid_attrs)
    refute changeset.valid?
  end
end
