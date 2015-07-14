defmodule User do
  @derive Collectable
  use Ecto.Model

  @primary_key {:id, :string, autogenerate: false}
  schema "users" do
    field    :full_name, :string
    has_many :waypoints, Waypoint
    timestamps
  end

  def changeset(waypoint, params \\ nil) do
  end
end
