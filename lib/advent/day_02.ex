defmodule Advent.Day02.Spec do
  @moduledoc """
  Defines password rules to apply to a password.

  In part 1, `min` and `max` define how many times `char` should appear in the password.

  In part 2, they define where in the string `char` must appear.
  """
  @enforce_keys [:char]
  defstruct [:char, min: 0, max: 0]
  @type t :: %Advent.Day02.Spec{char: String.t(), min: non_neg_integer(), max: non_neg_integer()}
end

defmodule Advent.Day02 do
  alias Advent.Day02.Spec

  @typep pw_check_fun :: (String.t(), %Advent.Day02.Spec{} -> boolean())

  @spec part1(String.t()) :: non_neg_integer
  def part1(input) do
    check(input, &pw_ok_part1?/2)
  end

  @spec part2(String.t()) :: non_neg_integer
  def part2(input) do
    check(input, &pw_ok_part2?/2)
  end

  @spec check(String.t(), pw_check_fun()) :: non_neg_integer()
  defp check(input, check_fn) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.filter(&Kernel.is_tuple/1)
    |> Enum.count(&check_fn.(elem(&1, 1), elem(&1, 0)))
  end

  @spec parse_line(String.t()) :: {Advent.Day02.Spec.t(), String.t()} | nil
  defp parse_line(line) do
    parts = Regex.named_captures(~r/^(?<min>\d+)\-(?<max>\d+) (?<c>[a-z])\: (?<pw>.+)$/, line)

    case parts do
      %{"min" => min, "max" => max, "c" => c, "pw" => pw} ->
        {
          %Spec{
            char: c,
            min: String.to_integer(min),
            max: String.to_integer(max)
          },
          pw
        }

      _ ->
        nil
    end
  end

  @spec pw_ok_part1?(String.t(), Advent.Day02.Spec.t()) :: boolean()
  defp pw_ok_part1?(pw, %Spec{} = spec) do
    count =
      String.codepoints(pw)
      |> Enum.count(&(&1 == spec.char))

    count >= spec.min and count <= spec.max
  end

  @spec pw_ok_part2?(String.t(), Advent.Day02.Spec.t()) :: boolean()
  defp pw_ok_part2?(pw, %Spec{} = spec) do
    a = String.at(pw, spec.min - 1)
    b = String.at(pw, spec.max - 1)

    (a == spec.char or b == spec.char) and a != b
  end
end
