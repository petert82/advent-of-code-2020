defmodule Advent.Day03 do
  @spec part1(String.t()) :: non_neg_integer()
  def part1(input) do
    rows = String.split(input)

    ski_with_step(rows, 3, 1)
  end

  @spec part2(String.t()) :: non_neg_integer()
  def part2(input) do
    rows = String.split(input)

    steps = [
      {1, 1},
      {3, 1},
      {5, 1},
      {7, 1},
      {1, 2}
    ]

    Enum.reduce(steps, 1, fn {x_step, y_step}, acc ->
      acc * ski_with_step(rows, x_step, y_step)
    end)
  end

  @spec ski_with_step(list(), non_neg_integer(), non_neg_integer()) :: non_neg_integer()
  defp ski_with_step(rows, x_step, y_step) do
    width =
      case Enum.count(rows) do
        0 -> 0
        _ -> Enum.at(rows, 0, "") |> String.length()
      end

    ski(rows, width, 0, 0, x_step, y_step, 0)
  end

  @spec ski(
          list(),
          non_neg_integer(),
          non_neg_integer(),
          non_neg_integer(),
          non_neg_integer(),
          non_neg_integer(),
          non_neg_integer()
        ) :: non_neg_integer()
  defp ski(rows, width, x, y, x_step, y_step, acc)
  defp ski(rows, _width, _x, y, _x_step, _y_step, acc) when y > length(rows), do: acc

  defp ski(rows, width, x, y, x_step, y_step, acc) do
    if is_tree?(rows, width, x, y) do
      ski(rows, width, x + x_step, y + y_step, x_step, y_step, acc + 1)
    else
      ski(rows, width, x + x_step, y + y_step, x_step, y_step, acc)
    end
  end

  @spec is_tree?(list(), non_neg_integer(), non_neg_integer(), non_neg_integer()) :: boolean()
  defp is_tree?(rows, width, x, y) do
    row = Enum.at(rows, y, "")
    test_x = rem(x, width)

    String.at(row, test_x) == "#"
  end
end
