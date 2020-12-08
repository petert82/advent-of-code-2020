defmodule Advent.Day05Test do
  use ExUnit.Case
  doctest Advent.Day05

  import Advent.Day05

  @tag :day05
  test "can get seat ID for part 1" do
    seat_ids = [
      ["FBFBBFFRLR", 357],
      ["BFFFBBFRRR", 567],
      ["FFFBBBFRRR", 119],
      ["BBFFBBFRLL", 820]
    ]

    Enum.each(seat_ids, fn [code, expect_id] -> assert part1(code) == expect_id end)
  end

  @tag :day05
  test "part1 (good input)" do
    input = """
    FBFBBFFRLR
    BFFFBBFRRR
    FFFBBBFRRR
    BBFFBBFRLL
    """

    assert part1(input) == 820
  end

  @tag :day05
  test "can find gap in ID list for part 2" do
    ids = [1, 2, 4, 5]

    assert find_missing_id(ids) == 3
  end
end
