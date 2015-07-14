defmodule FixturesToDb.Repo.Migrations.CreateWaypoint do
  use Ecto.Migration

  def change do
    create table(:waypoints) do
      add :title,       :string
      add :summary,     :string
      add :description, :text
      timestamps
    end

  end
end
