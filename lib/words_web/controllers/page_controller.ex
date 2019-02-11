defmodule WordsWeb.PageController do
  use WordsWeb, :controller
  require Ecto.Query

  require Logger

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def words(conn, %{"keys" => words}) do
    # IO.puts params
    words = String.split(words, ",")

    defs = Ecto.Query.from(w in Words.Words, where: w.word in ^words, select: {w.word, w.defn})
          |> Words.Repo.all
    
    Logger.debug "Var value: #{inspect(defs)}"
    clean_defs = defs
                |> Enum.map( fn x ->  %{
                word: elem(x, 0),
                definition: elem(x, 1)  } end)

    json(conn, %{defs: clean_defs})
    # render(conn, "index.html")
  end
end
