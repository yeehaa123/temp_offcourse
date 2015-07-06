defmodule Checkpoint do
  @derive Collectable
  use Ecto.Model

  schema "checkpoints" do
    field :title
    belongs_to :waypoint, Waypoint
    has_many :resources, Resource
    timestamps
  end

  def changeset(checkpoint, params \\ nil) do
    checkpoint
  end
end
