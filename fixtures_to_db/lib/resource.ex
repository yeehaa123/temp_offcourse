defmodule Resource do
  @derive Collectable
  use Ecto.Model

  schema "resources" do
    field :title
    belongs_to :checkpoint, Checkpoint
    timestamps
  end

  def changeset(resource, params \\ nil) do
    resource
  end
end
