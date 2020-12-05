defmodule Advent.Day02Test do
  use ExUnit.Case
  doctest Advent.Day02

  import Advent.Day02

  @tag :day02
  test "part1 (good input)" do
    input = """
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    """

    assert part1(input) == 2
  end

  @tag :day02
  test "part2 (good input)" do
    input = """
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    """

    assert part2(input) == 1
  end
end
