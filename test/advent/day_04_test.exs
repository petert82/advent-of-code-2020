defmodule Advent.Day04Test do
  use ExUnit.Case
  doctest Advent.Day04

  import Advent.Day04

  @tag :day04
  test "part1 (good input)" do
    input = """
    ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
    byr:1937 iyr:2017 cid:147 hgt:183cm

    iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
    hcl:#cfa07d byr:1929

    hcl:#ae17e1 iyr:2013
    eyr:2024
    ecl:brn pid:760753108 byr:1931
    hgt:179cm

    hcl:#cfa07d eyr:2025 pid:166559648
    iyr:2011 ecl:brn hgt:59in
    """

    assert part1(input) == 2
  end

  @tag :day04
  test "part2 does not count passports with any invalid field values" do
    input = """
    eyr:1972 cid:100
    hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

    iyr:2019
    hcl:#602927 eyr:1967 hgt:170cm
    ecl:grn pid:012533040 byr:1946

    hcl:dab227 iyr:2012
    ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

    hgt:59cm ecl:zzz
    eyr:2038 hcl:74454a iyr:2023
    pid:3556412378 byr:2007

    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1919
    hcl:#623a2f

    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:2003
    hcl:#623a2f

    pid:087499704 hgt:74in ecl:grn iyr:2009 eyr:2030 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:74in ecl:grn iyr:2021 eyr:2030 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2019 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2031 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:149cm ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:194cm ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:58in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:77 ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#12345ab

    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#abcde

    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2z

    pid:087499704 hgt:74in ecl:bad iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    pid:01234567 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    pid:0123456789 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    pid:x87499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f
    """

    assert part2(input) == 0
  end

  @tag :day04
  test "part2 does count passports with only valid field values" do
    input = """
    pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
    hcl:#623a2f

    eyr:2029 ecl:blu cid:129 byr:1989
    iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

    hcl:#888785
    hgt:164cm byr:2001 iyr:2015 cid:88
    pid:545766238 ecl:hzl
    eyr:2022

    iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
    """

    assert part2(input) == 4
  end
end
