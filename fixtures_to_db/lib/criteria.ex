defmodule Criteria do
  @derive Collectable
  use Ecto.Model

  schema "criteria" do
    field :clarity,      :integer
    field :difficulty,   :integer
    field :up_to_date,   :integer
    field :pertinence,   :integer
    field :enjoyment,    :integer
    belongs_to :resource, Resource
    timestamps
  end

  def changeset(waypoint, params \\ nil) do
    waypoint
  end
end
