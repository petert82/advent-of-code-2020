defmodule Mix.Tasks.D03.P1 do
  use Mix.Task

  @shortdoc "Day 03 Part 1"
  def run(_args) do
    Advent.Input.read!("03")
    |> Advent.Day03.part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
