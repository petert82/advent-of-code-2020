defmodule Mix.Tasks.D02.P1 do
  use Mix.Task

  @shortdoc "Day 02 Part 1"
  def run(_args) do
    Advent.Input.read!("02")
    |> Advent.Day02.part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
