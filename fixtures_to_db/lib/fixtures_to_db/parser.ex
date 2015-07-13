defmodule Parser do
  alias FixturesToDb.Repo
  alias Ecto.Type

  def parse(file_path) do
    Path.wildcard(file_path)
    |> Enum.map(&parse_file(&1))
  end

  defp parse_file(document) do
    document
    |> :yamerl_constr.file
    |> hd
    |> get_docs([:curator, :title, :summary, :description, :checkpoints])
    |> Enum.into(%Waypoint{})
    |> Waypoint.changeset
    |> saveWaypoint
  end
  
  defp create_checkpoint(document) do
    document
    |> get_docs([:title, :description, :instructions, :resources])
    |> Enum.into(%Checkpoint{})
    |> Checkpoint.changeset
  end

  defp create_resource(document) do
    document
    |> get_docs([:title, :criteria, :url, :time_to_digest, :type, :notes])
    |> Enum.into(%Resource{})
    |> Resource.changeset
  end

  defp create_criteria(document) do
    document
    |> get_criteria([:clarity, :difficulty, :up_to_date, :pertinence, :enjoyment])
    |> Enum.into(%Criteria{})
    |> Criteria.changeset
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
    Repo.transaction fn ->
      checkpoint = Repo.insert(checkpoint)
      resources = Enum.map(checkpoint.resources, &create_resource(&1))
      Enum.map(resources, &saveResource(&1, checkpoint.id))
    end
  end

  defp saveResource(resource, checkpoint_id) do
    resource = Ecto.Changeset.change(resource, checkpoint_id: checkpoint_id)
    Repo.transaction fn ->
      resource = Repo.insert(resource)
      criteria = create_criteria(resource.criteria) 
      criteria = Ecto.Changeset.change(criteria, resource_id: resource.id)
      Repo.insert(criteria)
    end
  end

  defp get_docs(document, fields) do
    fields 
    |> Enum.map(&get_doc(document, &1))
  end

  defp get_criteria(document, fields) do
    fields 
    |> Enum.map(&get_criterium(document, &1))
  end

  defp get_criterium(document, field) do
    val = field
    |> extract_value(document)
    { field, val }
  end
  
  defp get_doc(document, field) when field == :criteria do
    val = field
    |> extract_value(document)
    { field, val }
  end

  defp get_doc(document, field) when field == :checkpoints or field == :resources do
    val = field
    |> extract_value(document)
    { field, val }
  end

  defp get_doc(document, field) when field == :instructions do
    val = field
    |> extract_value(document)
    |> Enum.map(&to_string(&1))
    { field, val }
  end

  defp get_doc(document, field) do
    val = field
    |> extract_value(document)
    |> to_string
    |> String.strip
    { field, val }
  end

  defp extract_value(field, document) do
    field
    |> Atom.to_char_list
    |> :proplists.get_value(document)
   end
end
