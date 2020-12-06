defmodule Mix.Tasks.D03.P2 do
  use Mix.Task

  @shortdoc "Day 03 Part 2"
  def run(_args) do
    Advent.Input.read!("03")
    |> Advent.Day03.part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
