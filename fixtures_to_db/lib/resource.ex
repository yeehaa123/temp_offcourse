defmodule Resource do
  @derive Collectable
  use Ecto.Model
  
  schema "resources" do
    field :title,           :string
    field :url,             :string
    field :time_to_digest,  :string
    field :type,            :string
    field :notes,           :string
    has_one :criteria,      Criteria
    belongs_to :checkpoint, Checkpoint
    timestamps
  end

  def changeset(resource, params \\ nil) do
    resource
  end
end
