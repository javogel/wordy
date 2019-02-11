defmodule Words.Words do
    use Ecto.Schema
    # import Ecto.Changeset
  

  @primary_key {:word, :string, []}
  @derive {Phoenix.Param, key: :word}
    schema "words" do
    #   field :word, :string
      field :type, :string
      field :sdex, :string
      field :wlen, :integer
      field :defn, :string
  
    end

    # def changeset(struct, params \\ %{}) do
    #   struct
    #   |> cast(params, :word, :type, :sdex, :wlen, :defn)
    # end
  end
  