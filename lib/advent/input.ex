defmodule Advent.Input do
  @moduledoc """
  Allows puzzle input for each day to be placed in files under the project's "input" directory.
  """

  @doc """
  Gets the input for a puzzle from a file in the "input" directory.

  Input files are expected to be named following the pattern: `"day" + [day_num]`

  For example, the input for day one should be in a file called "day01".
  """
  def read!(suffix) do
    File.open!("./input/day" <> suffix, [:read, :utf8])
    |> IO.read(:all)
  end
end
