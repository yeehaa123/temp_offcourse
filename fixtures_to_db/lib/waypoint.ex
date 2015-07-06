defmodule Waypoint do
  @derive Collectable
  use Ecto.Model

  schema "waypoints" do
    field :title
    field :curator
    field :summary
    field :description
    has_many :checkpoints, Checkpoint
    timestamps
  end

  def changeset(waypoint, params \\ nil) do
    waypoint
  end
end
