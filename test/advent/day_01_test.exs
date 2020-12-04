defmodule Advent.Day01Test do
  use ExUnit.Case
  doctest Advent.Day01

  import Advent.Day01

  @tag :day01
  test "part1 (bad input)" do
    input = """
    979
    366
    675
    1456
    """

    assert part1(input) == nil
  end

  @tag :day01
  test "part1 (good input)" do
    input = """
    1721
    979
    366
    299
    675
    1456
    """

    assert part1(input) == 514_579
  end

  @tag :day01
  test "part2 (bad input)" do
    input = """
    1721
    366
    299
    675
    1456
    """

    assert part2(input) == nil
  end

  @tag :day01
  test "part2 (good input)" do
    input = """
    1721
    979
    366
    299
    675
    1456
    """

    assert part2(input) == 241_861_950
  end
end
