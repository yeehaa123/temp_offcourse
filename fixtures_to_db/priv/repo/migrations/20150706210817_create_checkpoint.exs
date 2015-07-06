defmodule FixturesToDb.Repo.Migrations.CreateCheckpoint do
  use Ecto.Migration

  def change do
    create table(:checkpoints) do
      add :title,    :string
      add :waypoint_id, references(:waypoints)
      timestamps
    end
  end
end
