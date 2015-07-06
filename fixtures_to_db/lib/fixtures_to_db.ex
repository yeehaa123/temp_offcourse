defmodule FixturesToDb do
  use Application

  import Ecto.Query
  def sample_query do
    query = from w in Waypoint, select: w.title
    FixturesToDb.Repo.all(query)
  end
end
