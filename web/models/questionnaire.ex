defmodule Platform.Questionnaire do
  use Platform.Web, :model

  schema "question_list" do
    field :questions, :string
    field :answer1, :string
    field :answer2, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:questions, :answer1, :answer2])
    |> validate_required([:questions, :answer1, :answer2])
  end
end
