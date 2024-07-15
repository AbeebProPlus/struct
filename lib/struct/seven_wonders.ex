defmodule Tutorials.Struct.SevenWonders do
  defstruct name: "", country: ""
  alias Tutorials.Struct.SevenWonders

  @type t :: %SevenWonders{
    name: String.t(),
    country: String.t()
  }

  @spec all :: [t()]
  def all do
    [
      %SevenWonders{name: "Great Wall of China", country: "China"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Chichen Itza", country: "Mexico"},
      %SevenWonders{name: "Roman Colosseum", country: "Italy"},
      %SevenWonders{name: "Taj Mahal", country: "India"}
    ]
  end

  @spec print_name([t()]) :: :ok
  def print_name(wonders) do
    Enum.each(wonders, fn %{name: wonder_name} -> IO.puts(wonder_name) end)
  end

  @spec filter_by_name([t()], String.t()) :: [t()]
  def filter_by_name(wonders, w_name) do
    Enum.filter(wonders, fn %{name: name} -> name == w_name end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, w_country) do
    Enum.filter(wonders, fn %{country: country} -> country == w_country end)
  end

  @spec country_start_with([t()], String.t()) :: [t()]
  def country_start_with(wonders, alphabet) do
    Enum.filter(wonders, fn %{country: country} -> String.starts_with?(country, alphabet) end)
  end

  def sort_by_country_length(wonders) do
    Enum.sort(wonders, fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  def name_country_list(wonders) do
    Enum.map(wonders, fn wonder -> [wonder.name, wonder.country] end)
  end

  def country_name_keyword_list(wonders) do
    Enum.map(wonders, fn wonder -> [{String.to_atom(wonder.country), wonder.name}] end)
  end

  def country_names(wonders) do
    Enum.map(wonders, fn wonder -> wonder.name end)
  end

  def country_names_using_for(wonders) do
    for %{name: name} <- wonders, do: name
  end
end
