defmodule Advent.Day06Test do
  use ExUnit.Case
  doctest Advent.Day06

  import Advent.Day06

  @tag :day06
  test "part1" do
    input = """
    abc

    a
    b
    c

    ab
    ac

    a
    a
    a
    a

    b
    """

    assert part1(input) == 11
  end

  @tag :day06
  test "part2" do
    input = """
    abc

    a
    b
    c

    ab
    ac

    a
    a
    a
    a

    b
    """

    assert part2(input) == 6
  end
end
