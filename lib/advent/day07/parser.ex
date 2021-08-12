defmodule Advent.Day07.Parser do
  import NimbleParsec

  alias Advent.Day07.Parser.Helpers

  @doc ~S"""
  See: https://blog.drewolson.org/parser-combinators-in-elixir
  And: https://hexdocs.pm/nimble_parsec/NimbleParsec.html

    iex> lines = "light red bags contain 1 bright white bag, 2 muted yellow bags.\ndark orange bags contain 3 bright white bags, 4 muted yellow bags."
    iex> {:ok, result, _, _, _, _} = Advent.Day07.Parser.bags(lines)
    iex> result
    [
      %{bag: "light red", contents: [{1, "bright white"}, {2, "muted yellow"}]},
      %{bag: "dark orange", contents: [{3, "bright white"}, {4, "muted yellow"}]}
    ]

    iex> lines = "faded blue bags contain no other bags."
    iex> {:ok, result, _, _, _, _} = Advent.Day07.Parser.bags(lines)
    iex> result
    [%{bag: "faded blue", contents: []}]
  """
  defparsec(
    :bags,
    Helpers.bag_lines()
  )
end
