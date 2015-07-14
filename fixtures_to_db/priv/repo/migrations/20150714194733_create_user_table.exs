defmodule FixturesToDb.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      timestamps
    end

    alter table(:waypoints) do
      add :curator, references(:users, type: :string)
     end
  end
end
