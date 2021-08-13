defmodule Advent.Day07.Parser.Helpers do
  import NimbleParsec

  @moduledoc false

  def separated_by(combinator, separator) do
    sep_comb = ignore(separator) |> concat(combinator)

    combinator |> times(sep_comb, min: 0)
  end

  # "light red"
  def bag_spec do
    ascii_string([?a..?z], min: 1)
    |> ignore(string(" "))
    |> ascii_string([?a..?z], min: 1)
    |> ignore(string(" bag"))
    |> optional(ignore(string("s")))
    |> reduce({Enum, :join, [" "]})
  end

  # the bag at the start of the line
  def outer_bag do
    bag_spec()
    |> unwrap_and_tag(:bag)
  end

  def number do
    integer(min: 1)
  end

  # "1 bright white bag"
  def bag_content do
    number()
    |> ignore(string(" "))
    |> concat(bag_spec())
    |> reduce({List, :to_tuple, []})
  end

  # 1 bright white bag, 2 muted yellow bags
  def list_of_bag_contents do
    bag_content()
    |> separated_by(string(", "))
    |> tag(:contents)
  end

  # "no other bags"
  def empty_contents do
    string("no other bags")
    |> replace([])
    |> unwrap_and_tag(:contents)
  end

  # A bag's contents are either one or more other types of bag or nothing.
  def bag_contents do
    choice([
      empty_contents(),
      list_of_bag_contents()
    ])
  end

  # "light red bags contain 1 bright white bag, 2 muted yellow bags."
  # "light red bags contain no other bags."
  def bag_with_contents do
    outer_bag()
    |> ignore(string(" contain "))
    |> concat(bag_contents())
    |> ignore(string("."))
    # convert the kw list `[bag: "light red", contents: [...]]` into a map
    |> reduce({Map, :new, []})
  end

  def bag_lines do
    bag_with_contents()
    |> separated_by(string("\n"))
    |> eos()
  end
end
