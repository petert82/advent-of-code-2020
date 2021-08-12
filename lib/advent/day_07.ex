defmodule Advent.Day07 do
  @moduledoc """
  The bulk of this logic, minus the parsing, is a translation of [this](https://fasterthanli.me/series/advent-of-code-2020/part-7)
  from Rust to Elixir.
  """
  alias Advent.Day07.Parser

  @spec part1(binary) :: non_neg_integer
  def part1(input) do
    rules = parse_rules(input)
    needle = "shiny gold"

    colors_that_contain_shiny_gold =
      Map.keys(rules)
      |> Enum.filter(&(&1 != needle))
      |> Enum.filter(&subgraph_contains(rules, &1, needle))

    Enum.count(colors_that_contain_shiny_gold)
  end

  defp parse_rules(input) do
    {:ok, bags, _, _, _, _} = String.trim(input) |> Parser.bags()
    Enum.reduce(bags, %{}, &Map.put(&2, &1[:bag], &1[:contents]))
  end

  defp subgraph_contains(graph, root, needle) do
    Map.get(graph, root, [])
    |> Enum.any?(fn {_, neighbour} ->
      neighbour == needle or subgraph_contains(graph, neighbour, needle)
    end)
  end

  @spec part2(String.t()) :: non_neg_integer()
  def part2(input) do
    rules = parse_rules(input)
    root = "shiny gold"

    bag_quantities(rules, root) |> Enum.sum()
  end

  defp bag_quantities(graph, root) do
    inner_bags = Map.get(graph, root, [])

    Enum.flat_map(inner_bags, fn {qty, bag} ->
      [qty] ++ (bag_quantities(graph, bag) |> Enum.map(&(&1 * qty)))
    end)
  end
end
