defmodule Advent.Day05 do
  @spec part1(String.t()) :: non_neg_integer()
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&seat_id/1)
    |> Enum.max()
  end

  @doc """
  It's a completely full flight, so your seat should be the only missing boarding pass in your list.
  However, there's a catch: some of the seats at the very front and back of the plane don't exist on
  this aircraft, so they'll be missing from your list as well.

  Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will
  be in your list.
  """
  @spec part2(String.t()) :: non_neg_integer()
  def part2(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&seat_id/1)
    |> find_missing_id()
  end

  @spec seat_id(String.t()) :: non_neg_integer()
  def seat_id(<<row_spec::binary-size(7), col_spec::binary-size(3)>>) do
    row = partition(row_spec, 0, 127)
    col = partition(col_spec, 0, 7)

    trunc(row * 8 + col)
  end

  @spec find_missing_id(list()) :: non_neg_integer()
  def find_missing_id(ids) do
    Enum.sort(ids)
    |> Enum.reduce_while(-1, fn x, prev ->
      cond do
        prev == -1 -> {:cont, x}
        prev == x - 1 -> {:cont, x}
        true -> {:halt, prev + 1}
      end
    end)
  end

  # (F|L) | (B|R)
  # 0 1 2 3|4 5 6 7
  # First 2 clauses here are to avoid having to duplicate all the conditions for
  # F/L and B/R
  defp partition("L" <> rest, min, max), do: partition("F" <> rest, min, max)
  defp partition("R" <> rest, min, max), do: partition("B" <> rest, min, max)
  defp partition("F", min, _max), do: min
  defp partition("B", _min, max), do: max
  defp partition("F" <> rest, min, max), do: partition(rest, min, (min + max + 1) / 2 - 1)
  defp partition("B" <> rest, min, max), do: partition(rest, (min + max + 1) / 2, max)
end
