defmodule Advent.Day04 do
  @typep passport_check :: (map() -> boolean())

  @spec part1(String.t()) :: non_neg_integer()
  def part1(input) do
    check_passports(input, &valid_part1_passport?/1)
  end

  @spec part2(String.t()) :: non_neg_integer()
  def part2(input) do
    check_passports(input, &valid_part2_passport?/1)
  end

  @spec check_passports(String.t(), passport_check()) :: non_neg_integer()
  defp check_passports(input, check_fn) do
    input
    |> String.split("\n\n")
    |> Enum.map(&parse/1)
    |> Enum.filter(check_fn)
    |> Enum.count()
  end

  @spec parse(String.t()) :: map()
  defp parse(raw_passport) do
    raw_passport
    |> String.split()
    |> Enum.map(fn field ->
      [k, v] = String.split(field, ":", parts: 2)

      case {String.to_atom(k), v} do
        # four digits; at least 1920 and at most 2002
        {:byr, yr} -> {:byr, String.to_integer(yr)}
        # four digits; at least 2010 and at most 2020.
        {:iyr, yr} -> {:iyr, String.to_integer(yr)}
        # four digits; at least 2020 and at most 2030
        {:eyr, yr} -> {:eyr, String.to_integer(yr)}
        # a number followed by either cm or in
        {:hgt, hgt} -> {:hgt, parse_hgt(hgt)}
        # a # followed by exactly six characters 0-9 or a-f
        {:hcl, hcl} -> {:hcl, parse_hcl(hcl)}
        # exactly one of: amb blu brn gry grn hzl oth
        {:ecl, ecl} -> {:ecl, ecl}
        # a nine-digit number, including leading zeroes
        {:pid, pid} -> {:pid, parse_pid(pid)}
        unknown -> unknown
      end
    end)
    |> Map.new()
  end

  @spec parse_hgt(String.t()) :: {:cm | :in, integer()}
  defp parse_hgt(hgt) do
    parts = Regex.named_captures(~r/^(?<num>\d+)(?<unit>cm|in)$/, hgt)

    case parts do
      %{"num" => num, "unit" => unit} -> {String.to_atom(unit), String.to_integer(num)}
      # An invalid height
      _ -> {:cm, 0}
    end
  end

  @spec parse_hcl(String.t()) :: {:valid | :invalid, String.t()}
  defp parse_hcl(hcl) do
    if hcl =~ ~r/^#[a-f0-9]{6}$/ do
      {:valid, hcl}
    else
      {:invalid, hcl}
    end
  end

  @spec parse_pid(String.t()) :: {:valid | :invalid, String.t()}
  defp parse_pid(pid) do
    if pid =~ ~r/^\d{9}$/ do
      {:valid, pid}
    else
      {:invalid, pid}
    end
  end

  @spec valid_part1_passport?(map()) :: boolean()
  defp valid_part1_passport?(%{byr: _, iyr: _, eyr: _, hgt: _, hcl: _, ecl: _, pid: _}), do: true
  defp valid_part1_passport?(_), do: false

  defguardp is_byr_ok(byr) when is_integer(byr) and byr >= 1920 and byr <= 2002
  defguardp is_iyr_ok(iyr) when is_integer(iyr) and iyr >= 2010 and iyr <= 2020
  defguardp is_eyr_ok(eyr) when is_integer(eyr) and eyr >= 2020 and eyr <= 2030
  defguardp is_hgt_cm_ok(hgt) when is_integer(hgt) and hgt >= 150 and hgt <= 193
  defguardp is_hgt_in_ok(hgt) when is_integer(hgt) and hgt >= 59 and hgt <= 76
  defguardp is_ecl_ok(ecl) when ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

  @spec valid_part2_passport?(map()) :: boolean()
  defp valid_part2_passport?(%{byr: byr}) when not is_byr_ok(byr), do: false
  defp valid_part2_passport?(%{iyr: iyr}) when not is_iyr_ok(iyr), do: false
  defp valid_part2_passport?(%{eyr: eyr}) when not is_eyr_ok(eyr), do: false
  defp valid_part2_passport?(%{hgt: {:cm, hgt}}) when not is_hgt_cm_ok(hgt), do: false
  defp valid_part2_passport?(%{hgt: {:in, hgt}}) when not is_hgt_in_ok(hgt), do: false
  defp valid_part2_passport?(%{hcl: {:invalid, _}}), do: false
  defp valid_part2_passport?(%{ecl: ecl}) when not is_ecl_ok(ecl), do: false
  defp valid_part2_passport?(%{pid: {:invalid, _}}), do: false
  defp valid_part2_passport?(passport), do: valid_part1_passport?(passport)
end
