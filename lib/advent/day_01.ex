defmodule Advent.Day01 do
  def part1(input) do
    nums =
      String.split(input)
      |> Enum.map(&String.to_integer/1)

    target =
      for(i <- nums, j <- nums, sum_to_target?(i, j), do: {i, j})
      |> List.first()

    case target do
      {i, j} -> i * j
      _ -> nil
    end
  end

  def part2(input) do
    nums =
      String.split(input)
      |> Enum.map(&String.to_integer/1)

    target =
      for(i <- nums, j <- nums, k <- nums, sum_to_target?(i, j, k), do: {i, j, k})
      |> List.first()

    case target do
      {i, j, k} -> i * j * k
      _ -> nil
    end
  end

  defp sum_to_target?(i, j) when i + j == 2020, do: true
  defp sum_to_target?(_, _), do: false
  defp sum_to_target?(i, j, k) when i + j + k == 2020, do: true
  defp sum_to_target?(_, _, _), do: false
end
