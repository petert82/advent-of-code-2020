defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  @shortdoc "Day 01 Part 1"
  def run(_args) do
    Advent.Input.read!("01")
    |> Advent.Day01.part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
