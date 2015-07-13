defmodule FixturesToDb.Repo.Migrations.CreateCriteria do
  use Ecto.Migration

  def change do
    create table(:criteria) do
      add :clarity,      :integer
      add :difficulty,   :integer
      add :up_to_date,   :integer
      add :pertinence,   :integer
      add :enjoyment,    :integer
      add :resource_id,  references(:resources)
      timestamps
    end
  end
end
