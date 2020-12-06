defmodule Mix.Tasks.D02.P2 do
  use Mix.Task

  @shortdoc "Day 02 Part 2"
  def run(_args) do
    Advent.Input.read!("02")
    |> Advent.Day02.part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
