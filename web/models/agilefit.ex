defmodule Platform.Agilefit do
  use Platform.Web, :model

  schema "criteria_agile" do
    field :criterias, :string
    field :answer1, :string
    field :answer2, :string
    field :answer3, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:criterias, :answer1, :answer2, :answer3])
    |> validate_required([:criterias, :answer1, :answer2])
  end
end
