defmodule Advent.Day03Test do
  use ExUnit.Case
  doctest Advent.Day03

  import Advent.Day03

  @tag :day03
  test "part1 (good input)" do
    input = """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """

    assert part1(input) == 7
  end

  @tag :day03
  test "part2 (good input)" do
    input = """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """

    assert part2(input) == 336
  end
end
