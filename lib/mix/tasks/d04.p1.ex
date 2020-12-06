defmodule Mix.Tasks.D04.P1 do
  use Mix.Task

  @shortdoc "Day 04 Part 1"
  def run(_args) do
    Advent.Input.read!("04")
    |> Advent.Day04.part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
