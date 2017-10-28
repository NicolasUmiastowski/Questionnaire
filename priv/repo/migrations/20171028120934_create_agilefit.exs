defmodule Platform.Repo.Migrations.CreateAgilefit do
  use Ecto.Migration

  def change do
    create table(:criteria_agile) do
      add :criterias, :string
      add :answer1, :string
      add :answer2, :string

      timestamps()
    end

  end
end
