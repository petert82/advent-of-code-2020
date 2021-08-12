defmodule Advent.Day07 do
  alias Advent.Day07.Parser

  @spec part1(binary) :: non_neg_integer
  def part1(input) do
    {:ok, bags, _, _, _, _} = String.trim(input) |> Parser.bags()
    rules = Enum.reduce(bags, %{}, &Map.put(&2, &1[:bag], &1[:contents]))
    needle = "shiny gold"

    colors_that_contain_shiny_gold =
      Map.keys(rules)
      |> Enum.filter(&(&1 != needle))
      |> Enum.filter(&subgraph_contains(rules, &1, needle))

    Enum.count(colors_that_contain_shiny_gold)
  end

  defp subgraph_contains(graph, root, needle) do
    Map.get(graph, root, [])
    |> Enum.any?(fn {_, neighbour} ->
      neighbour == needle or subgraph_contains(graph, neighbour, needle)
    end)
  end

  @spec part2(String.t()) :: non_neg_integer()
  def part2(_input) do
    2
  end
end
