defmodule Waypoint do
  @derive Collectable
  use Ecto.Model

  schema "waypoints" do
    field      :title,       :string
    field      :summary,     :string
    field      :description, :string
    belongs_to :users,       User,      foreign_key: :curator, type: :string
    has_many   :checkpoints, Checkpoint
    timestamps
  end

  def changeset(waypoint, params \\ nil) do
    waypoint
  end
end
