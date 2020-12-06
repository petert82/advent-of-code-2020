defmodule Mix.Tasks.D04.P2 do
  use Mix.Task

  @shortdoc "Day 04 Part 2"
  def run(_args) do
    Advent.Input.read!("04")
    |> Advent.Day04.part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
