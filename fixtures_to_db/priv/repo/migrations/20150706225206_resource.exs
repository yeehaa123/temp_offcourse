defmodule FixturesToDb.Repo.Migrations.Resource do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :title,          :string
      add :authors,        {:array, :string}
      add :url,            :string
      add :time_to_digest, :string
      add :type,           :string
      add :notes,          :text
      add :checkpoint_id,  references(:checkpoints)
      timestamps
    end
  end
end
