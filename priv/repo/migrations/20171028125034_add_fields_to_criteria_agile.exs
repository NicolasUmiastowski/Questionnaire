defmodule Platform.Repo.Migrations.AddFieldsToCriteriaAgile do
  use Ecto.Migration

  def change do
    alter table(:criteria_agile) do
      add :answer3, :string
    end
  end
end
