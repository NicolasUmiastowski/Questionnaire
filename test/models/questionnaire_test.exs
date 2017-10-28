defmodule Platform.QuestionnaireTest do
  use Platform.ModelCase

  alias Platform.Questionnaire

  @valid_attrs %{answer1: "some content", answer2: "some content", questions: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Questionnaire.changeset(%Questionnaire{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Questionnaire.changeset(%Questionnaire{}, @invalid_attrs)
    refute changeset.valid?
  end
end
