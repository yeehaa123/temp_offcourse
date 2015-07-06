defmodule FixturesToDb.Repo.Migrations.Resource do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :title, :string
      add :checkpoint_id, references(:checkpoints)
      timestamps
    end
  end
end
