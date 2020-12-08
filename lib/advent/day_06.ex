defmodule Advent.Day06 do
  @spec part1(String.t()) :: non_neg_integer()
  def part1(input) do
    String.split(input, "\n\n", trim: true)
    |> Enum.map(&count_anyone_answered_questions/1)
    |> Enum.sum()
  end

  @spec part2(String.t()) :: non_neg_integer()
  def part2(input) do
    String.split(input, "\n\n", trim: true)
    |> Enum.map(&count_everyone_answered_questions/1)
    |> Enum.sum()
  end

  @spec count_anyone_answered_questions(String.t()) :: non_neg_integer()
  defp count_anyone_answered_questions(group_lines) do
    String.replace(group_lines, "\n", "")
    |> String.codepoints()
    |> Enum.into(MapSet.new())
    |> Enum.count()
  end

  @spec count_everyone_answered_questions(String.t()) :: non_neg_integer()
  defp count_everyone_answered_questions(group_input) do
    lines = String.split(group_input, "\n", trim: true)
    person_count = Enum.count(lines)

    lines
    # Build a map where each key is a letter representing a question, and the value is how many
    # people in the group answered yes to the question
    |> Enum.reduce(%{}, fn line, counts ->
      String.codepoints(line)
      |> Enum.reduce(counts, fn q, counts ->
        Map.update(counts, q, 1, fn count -> count + 1 end)
      end)
    end)
    # Values from the map are a list of counts per question, we don't care about linking counts to
    # specific questions any more at this point
    |> Map.values()
    # If a count for a question is equal to the person count, that means everyone in the group
    # answered the question
    |> Enum.filter(&(&1 == person_count))
    |> Enum.count()
  end
end
