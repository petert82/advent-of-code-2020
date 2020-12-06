defmodule Mix.Tasks.D01.P2 do
  use Mix.Task

  @shortdoc "Day 01 Part 2"
  def run(_args) do
    Advent.Input.read!("01")
    |> Advent.Day01.part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
