defmodule Parser do
  alias FixturesToDb.Repo

  def parse(file_path) do
    Path.wildcard(file_path)
    |> Enum.map(&create_waypoint(&1))
  end

  defp create_waypoint(document) do
    document
    |> :yamerl_constr.file
    |> hd
    |> get_docs([:curator, :title, :summary, :description, :checkpoints])
    |> Enum.into(%Waypoint{})
    |> Waypoint.changeset
    |> saveWaypoint
  end

  defp saveWaypoint(waypoint) do
    checkpoints = Enum.map(waypoint.checkpoints, &create_checkpoint(&1))
    Repo.transaction fn ->
      waypoint = Repo.insert(waypoint)
      Enum.map(checkpoints, &saveCheckpoint(&1, waypoint.id))
    end
  end

  defp saveCheckpoint(checkpoint, waypoint_id) do
    checkpoint = Ecto.Changeset.change(checkpoint, waypoint_id: waypoint_id)
    checkpoint = Repo.insert(checkpoint)
    resources = Enum.map(checkpoint.resources, &create_resource(&1))
    Enum.map(resources, &saveResource(&1, checkpoint.id))
  end

  defp saveResource(resource, checkpoint_id) do
    resource = Ecto.Changeset.change(resource, checkpoint_id: checkpoint_id)
    Repo.insert(resource)
  end

  defp create_resource(document) do
    document
    |> get_docs([:title])
    |> Enum.into(%Resource{})
    |> Resource.changeset
  end

  defp create_checkpoint(document) do
    document
    |> get_docs([:title, :resources])
    |> Enum.into(%Checkpoint{})
    |> Checkpoint.changeset
  end

  defp get_docs(document, fields) do
    fields 
    |> Enum.map(&get_doc(document, &1))
  end

  defp get_doc(document, field) when field == :checkpoints or field == :resources do
    val = field
    |> extract_value(document)
    { field, val }
  end

  defp get_doc(document, field) do
    val = field
    |> extract_value(document)
    |> to_string
    { field, val }
  end

  defp extract_value(field, document) do
    field
    |> Atom.to_char_list
    |> :proplists.get_value(document)
   end
end
